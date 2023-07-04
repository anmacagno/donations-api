# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Donations' do
  include_context 'with mocked authentication'

  describe 'GET /api/v1/donations' do
    before { get api_v1_donations_path, as: :json }

    it 'returns http status ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the json' do
      expect(response.parsed_body).to eq([])
    end
  end

  describe 'POST /api/v1/donations' do
    context 'with invalid params' do
      let(:params) { { donation: {} } }

      it 'returns http status unprocessable entity' do
        post api_v1_donations_path(params), as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with valid params' do
      let(:params) do
        {
          donation: {
            email: 'john.doe@example.com',
            amount: 100,
            currency: 'usd',
            credit_card: {
              name: 'John Doe',
              number: '1111222233334444',
              expiration: '12/2023',
              cvv: '123'
            }
          }
        }
      end

      it 'returns http status ok' do
        post api_v1_donations_path(params), as: :json
        expect(response).to have_http_status(:ok)
      end

      it 'renders the json' do
        post api_v1_donations_path(params), as: :json
        expect(response.parsed_body.keys).to eq(%w[id email amount currency])
      end

      it 'creates the donation' do
        expect do
          post api_v1_donations_path(params), as: :json
        end.to change(Donation, :count).by(1)
      end
    end
  end

  describe 'PUT /api/v1/donations/:id' do
    let!(:donation) { create(:donation) }

    context 'with invalid params' do
      let(:params) { { donation: { amount: 0 } } }

      it 'returns http status unprocessable entity' do
        put api_v1_donation_path(donation, params), as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with valid params' do
      let(:params) { { donation: { amount: 125 } } }

      it 'returns http status ok' do
        put api_v1_donation_path(donation, params), as: :json
        expect(response).to have_http_status(:ok)
      end

      it 'renders the json' do
        put api_v1_donation_path(donation, params), as: :json
        expect(response.parsed_body.keys).to eq(%w[id email amount currency])
      end

      it 'updates the donation' do
        expect do
          put api_v1_donation_path(donation, params), as: :json
        end.to change { donation.reload.amount }.to(125)
      end
    end
  end

  describe 'DELETE /api/v1/donations/:id' do
    let!(:donation) { create(:donation) }

    it 'returns http status ok' do
      delete api_v1_donation_path(donation), as: :json
      expect(response).to have_http_status(:ok)
    end

    it 'renders the json' do
      delete api_v1_donation_path(donation), as: :json
      expect(response.parsed_body.keys).to eq(%w[id email amount currency])
    end

    it 'destroys the donation' do
      expect do
        delete api_v1_donation_path(donation), as: :json
      end.to change(Donation, :count).by(-1)
    end
  end
end
