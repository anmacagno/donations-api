# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :render_parameter_missing
  rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

  private

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
end
