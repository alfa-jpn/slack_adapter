require 'spec_helper'

describe SlackAdapter do
  describe '.config' do
    subject do
      SlackAdapter.config
    end

    it 'has token' do
      expect(subject).to respond_to(:token)
    end

    it 'has api_url' do
      expect(subject).to respond_to(:api_url)
    end
  end

  describe '.configure' do
    subject do
      SlackAdapter.configure do |config|
        config.class
      end
    end

    it 'execute block with config' do
      expect(subject).to be(OpenStruct)
    end
  end
end
