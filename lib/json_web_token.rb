# frozen_string_literal: true

class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base

  def self.encode(payload, expiration = 24.hours.from_now)
    JWT.encode(payload.merge(exp: expiration.to_i), SECRET_KEY)
  end

  def self.decode(token)
    decoded_token = JWT.decode(token, SECRET_KEY).first
    ActiveSupport::HashWithIndifferentAccess.new(decoded_token)
  end
end
