# frozen_string_literal: true

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:rspec) do |task|
  task.fail_on_error = false
end
