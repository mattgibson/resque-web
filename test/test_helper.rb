require 'dotenv'
Dotenv.load!

require 'redcard'
require 'profiler' if RedCard.check :rubinius

require 'coveralls'
Coveralls.wear! 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path('../dummy/config/environment', __FILE__)
require 'rails/test_help'

require 'minitest/spec'
require 'resque'
require 'mocha/setup'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end
