require 'ostruct'
require 'slack_adapter/version'
require 'slack_adapter/requester'

module SlackAdapter
  # Get configuration.
  # @return [OpenStruct] config.
  def self.config
    @config ||= OpenStruct.new({
      api_url: 'https://slack.com/api',
      token:   nil
    })
  end

  # Config in block.
  # @yield configure block.
  # @yield_param [OpenStruct] config config.
  def self.configure
    yield config
  end
end
