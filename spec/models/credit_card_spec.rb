# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreditCard do
  describe 'associations' do
    it { is_expected.to have_one(:donation) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to allow_value('1111222233334444').for(:number) }
    it { is_expected.not_to allow_value('111122223333abcd').for(:number) }
    it { is_expected.to validate_presence_of(:expiration) }
    it { is_expected.to allow_value('12/2023').for(:expiration) }
    it { is_expected.not_to allow_value('122023').for(:expiration) }
    it { is_expected.to validate_presence_of(:cvv) }
    it { is_expected.to allow_value('123').for(:cvv) }
    it { is_expected.not_to allow_value('abc').for(:cvv) }
  end
end
