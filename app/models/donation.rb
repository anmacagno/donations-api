# frozen_string_literal: true

class Donation < ApplicationRecord
  belongs_to :payable, polymorphic: true, dependent: :destroy

  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, if: -> { email.present? }
  validates :amount, presence: true
  validates :amount, comparison: { greater_than: 0 }, if: -> { amount.present? }
  validates :currency, presence: true

  enum :currency, { ars: 'ars', mxn: 'mxn', usd: 'usd' }, prefix: true

  store :request, accessors: %i[remote_ip user_agent], coder: JSON

  scope :by_start_date, ->(start_date) { where('date(created_at) >= ?', start_date) if start_date.present? }
  scope :by_end_date, ->(end_date) { where('date(created_at) <= ?', end_date) if end_date.present? }
end
