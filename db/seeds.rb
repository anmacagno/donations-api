# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

emails = %w[
  test1@example.com
  test2@example.com
  test3@example.com
]

emails.each do |email|
  User.find_or_create_by(email:) do |user|
    user.password = '12345678'
  end
end
