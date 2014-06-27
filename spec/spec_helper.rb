ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rack/test'

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.before(:each) do
    PlaylistRepository.clear
  end
end
