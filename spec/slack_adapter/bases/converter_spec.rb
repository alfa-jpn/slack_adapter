require 'spec_helper'

describe SlackAdapter::Bases::Converter do

  describe '.convert' do
    subject do
      SlackAdapter::Bases::Converter.convert!(value, type)
    end

    let :value do
      'true'
    end

    let :type do
      SlackAdapter::Bases::Boolean
    end

    it 'Call converter convert' do
      expect(SlackAdapter::Bases::Converters::BooleanConverter).to receive(:convert).with(value).once
      subject
    end

    context 'When unknown converter' do
      let :type do
        RSpec
      end

      it 'Raise error' do
        expect { subject }.to raise_error(StandardError, 'unknown converter for RSpec')
      end
    end
  end
end
