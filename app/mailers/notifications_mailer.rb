# frozen_string_literal: true

class NotificationsMailer < ApplicationMailer
  def gratitude
    @donation = params[:donation]
    mail(to: @donation.email)
  end
end
