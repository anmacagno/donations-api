# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Authentication' do
  describe 'POST /api/v1/login' do
    let(:user) { create(:user) }

    context 'with invalid params' do
      let(:params) { { user: {} } }

      it 'returns http status unprocessable entity' do
        post api_v1_login_path(params), as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with invalid password' do
      let(:params) do
        {
          user: {
            email: user.email,
            password: '87654321'
          }
        }
      end

      it 'returns http status unauthorized' do
        post api_v1_login_path(params), as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with valid password' do
      let(:params) do
        {
          user: {
            email: user.email,
            password: user.password
          }
        }
      end

      it 'returns http status ok' do
        post api_v1_login_path(params), as: :json
        expect(response).to have_http_status(:ok)
      end

      it 'renders the json' do
        post api_v1_login_path(params), as: :json
        expect(response.parsed_body.keys).to eq(%w[token expiration])
      end
    end
  end
end
