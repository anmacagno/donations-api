# frozen_string_literal: true

RSpec.shared_context 'with authentication headers' do
  require 'json_web_token'

  let(:user) { create(:user) }

  let(:headers) do
    {
      'Authorization' => JsonWebToken.encode(user_id: user.id)
    }
  end
end
