# frozen_string_literal: true

class ApplicationController < ActionController::API
  require 'json_web_token'

  rescue_from StandardError, with: :render_standard_error
  rescue_from ActionController::ParameterMissing, with: :render_parameter_missing
  rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

  private

  def render_standard_error(error)
    render json: { error: error.message }, status: :internal_server_error
  end

  def render_parameter_missing(error)
    render json: { error: error.message }, status: :unprocessable_entity
  end

  def render_record_invalid(error)
    render json: { error: error.message }, status: :unprocessable_entity
  end

  def render_record_not_found(error)
    render json: { error: error.message }, status: :not_found
  end

  def request_params
    {
      remote_ip: request.remote_ip,
      user_agent: request.headers['User-Agent']
    }
  end

  def authenticate_request
    token = request.headers['Authorization']
    decoded_token = JsonWebToken.decode(token)
    @current_user = User.find(decoded_token[:user_id])
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError => e
    render json: { errors: e.message }, status: :unauthorized
  end
end
