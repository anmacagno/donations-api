# frozen_string_literal: true

class Api::V1::AuthenticationController < ApplicationController
  def login
    user = User.find_by(email: login_params[:email])
    if user&.authenticate(login_params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      exp = (Time.current + 24.hours.to_i).strftime('%d-%m-%Y %H:%M')
      render json: { token:, exp: }, status: :ok
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
