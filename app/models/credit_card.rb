# frozen_string_literal: true

class CreditCard < ApplicationRecord
  has_one :donation, as: :payable, dependent: :restrict_with_exception

  validates :name, presence: true
  validates :number, presence: true
  validates :number, format: { with: /\A\d{16}\z/ }, if: -> { number.present? }
  validates :expiration, presence: true
  validates :expiration, format: { with: %r{\A\d{2}/\d{4}\z} }, if: -> { expiration.present? }
  validates :cvv, presence: true
  validates :cvv, format: { with: /\A\d{3}\z/ }, if: -> { cvv.present? }

  encrypts :number, :expiration, :cvv
end
