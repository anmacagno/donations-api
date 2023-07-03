# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Donation do
  describe 'associations' do
    it { is_expected.to belong_to(:payable) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to allow_value('user@example.com').for(:email) }
    it { is_expected.not_to allow_value('useratexampledotcom').for(:email) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.not_to allow_value(0).for(:amount) }
    it { is_expected.to validate_presence_of(:currency) }
  end

  describe 'enums' do
    it { is_expected.to define_enum_for(:currency).backed_by_column_of_type(:string).with_prefix }
  end
end
