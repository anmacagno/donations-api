# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com', reply_to: 'reply_to@example.com'
  layout 'mailer'
end
