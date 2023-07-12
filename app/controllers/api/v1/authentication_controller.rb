# frozen_string_literal: true

class Api::V1::AuthenticationController < ApplicationController
  before_action :set_user

  def login
    if @user&.authenticate(login_params[:password])
      payload = { user_id: @user.id }
      expiration = 24.hours.from_now
      token = JsonWebToken.encode(payload, expiration)
      render json: { token:, expiration: expiration.strftime('%d-%m-%Y %H:%M') }, status: :ok
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  private

  def set_user
    @user = User.find_by(email: login_params[:email])
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
