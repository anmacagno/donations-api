# frozen_string_literal: true

FactoryBot.define do
  factory :credit_card do
    name { 'John Doe' }
    number { '1111222233334444' }
    expiration { '12/2023' }
    cvv { '123' }
  end
end
