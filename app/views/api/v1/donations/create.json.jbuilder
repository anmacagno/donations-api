# frozen_string_literal: true

json.partial!('donation', donation: @donation)
json.credit_card do
  json.partial!('credit_card', credit_card: @donation.payable)
end
