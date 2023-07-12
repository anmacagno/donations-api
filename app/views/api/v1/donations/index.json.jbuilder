# frozen_string_literal: true

json.array!(@donations) do |donation|
  json.partial!('donation', donation:)
  json.credit_card do
    json.partial!('credit_card', credit_card: donation.payable)
  end
end
