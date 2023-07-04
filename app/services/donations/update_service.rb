# frozen_string_literal: true

module Donations
  class UpdateService < ApplicationService
    attr_reader :donation, :credit_card_params, :donation_params

    def initialize(donation, params)
      super()
      @donation = donation
      @credit_card_params = params[:credit_card]
      @donation_params = params.except(:credit_card)
    end

    def call
      ActiveRecord::Base.transaction do
        donation.payable.update!(credit_card_params) if credit_card_params
        donation.update!(donation_params)
      end
    end
  end
end
