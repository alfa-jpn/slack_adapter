$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'slack_adapter'
require 'webmock/rspec'

RSpec.configure do |config|
  config.before(:suite) do
    WebMock.disable_net_connect!
  end
end
