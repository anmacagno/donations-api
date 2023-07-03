# frozen_string_literal: true

json.array!(@donations, :id, :email, :amount, :currency)
