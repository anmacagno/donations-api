# frozen_string_literal: true

RSpec.shared_context 'with mocked authentication' do
  before do
    allow_any_instance_of(ApplicationController).to receive(:authenticate_request).and_return(true)
  end
end
