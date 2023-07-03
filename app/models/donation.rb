# frozen_string_literal: true

class Donation < ApplicationRecord
  belongs_to :payable, polymorphic: true, dependent: :destroy

  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, if: -> { email.present? }
  validates :amount, presence: true
  validates :amount, comparison: { greater_than: 0 }, if: -> { amount.present? }
  validates :currency, presence: true

  enum :currency, { ars: 'ars', mxn: 'mxn', usd: 'usd' }, prefix: true
end
