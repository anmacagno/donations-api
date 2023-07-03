# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, if: -> { email.present? }
  validates :password, presence: true
  validates :password, length: { minimum: 8 }, if: -> { password.present? }
  validates :password_digest, presence: true
end
