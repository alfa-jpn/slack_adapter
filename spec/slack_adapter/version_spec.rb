require 'spec_helper'

describe SlackAdapter::VERSION do
  it 'Valid format' do
    expect(SlackAdapter::VERSION).to match(/^\d+\.\d+\.\d+$/)
  end
end
