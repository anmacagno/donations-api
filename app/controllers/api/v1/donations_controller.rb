# frozen_string_literal: true

class Api::V1::DonationsController < ApplicationController
  before_action :set_donation, only: %i[update destroy]

  def index
    @donations = Donation.by_start_date(search_params[:start_date]).by_end_date(search_params[:end_date])
  end

  def create
    @donation = Donations::CreateService.call(donation_params.merge(request_params))
    NotificationsMailer.with(donation: @donation).gratitude.deliver_later
  end

  def update
    @donation.update!(donation_params)
  end

  def destroy
    @donation.destroy
  end

  private

  def set_donation
    @donation = Donation.find(params[:id])
  end

  def search_params
    params.permit(:start_date, :end_date)
  end

  def donation_params
    params.require(:donation).permit(:email, :amount, :currency, credit_card: %i[name number expiration cvv])
  end
end
