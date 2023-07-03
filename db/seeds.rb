# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

emails = %w[
  anmacagno@gmail.com
  agustin@donaronline.org
  felipe@donaronline.org
]

emails.each do |email|
  User.find_or_create_by(email:) do |user|
    user.password = '12345678'
  end
end
