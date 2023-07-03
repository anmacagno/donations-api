# frozen_string_literal: true

FactoryBot.define do
  factory :donation do
    email { 'john.doe@example.com' }
    amount { 100 }
    currency { 'usd' }
    payable { association :credit_card }
  end
end
