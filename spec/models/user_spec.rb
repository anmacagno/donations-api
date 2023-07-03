# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'macros' do
    it { is_expected.to have_secure_password }
  end

  describe 'validations' do
    subject { build(:user) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to allow_value('user@example.com').for(:email) }
    it { is_expected.not_to allow_value('useratexampledotcom').for(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
    it { is_expected.to validate_presence_of(:password_digest) }
  end
end
