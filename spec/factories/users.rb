# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "john.doe.#{n}@example.com" }
    password { '12345678' }
  end
end
