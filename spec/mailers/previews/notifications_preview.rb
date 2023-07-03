# frozen_string_literal: true

# Preview at http://localhost:3000/rails/mailers/notifications

class NotificationsPreview < ActionMailer::Preview
  def gratitude
    NotificationsMailer.with(donation:).gratitude
  end

  private

  def donation
    FactoryBot.build_stubbed(:donation)
  end
end
