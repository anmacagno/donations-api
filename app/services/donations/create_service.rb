# frozen_string_literal: true

module Donations
  class CreateService < ApplicationService
    attr_reader :credit_card_params, :donation_params

    def initialize(params)
      super()
      @credit_card_params = params[:credit_card]
      @donation_params = params.except(:credit_card)
    end

    def call
      ActiveRecord::Base.transaction do
        payable = CreditCard.create!(credit_card_params)
        Donation.create!(donation_params.merge(payable:))
      end
    end
  end
end
