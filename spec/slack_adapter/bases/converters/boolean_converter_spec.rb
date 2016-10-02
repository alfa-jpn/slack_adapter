require 'spec_helper'

describe SlackAdapter::Bases::Converters::BooleanConverter do

  let :converter do
    SlackAdapter::Bases::Converters::BooleanConverter
  end

  describe '.target' do
    subject do
      converter.target
    end

    it 'Return SlackAdapter::Bases::Boolean' do
      expect(subject).to eq(SlackAdapter::Bases::Boolean)
    end
  end

  describe '.convert' do
    subject do
      converter.convert(value)
    end

    context 'When value is true' do
      let :value do
        true
      end

      it 'Return truthy' do
        expect(subject).to be_truthy
      end
    end

    context 'When value is 1' do
      let :value do
        1
      end

      it 'Return truthy' do
        expect(subject).to be_truthy
      end
    end

    context 'When value is "true"' do
      let :value do
        'true'
      end

      it 'Return truthy' do
        expect(subject).to be_truthy
      end
    end

    context 'When value is false' do
      let :value do
        false
      end

      it 'Return falsey' do
        expect(subject).to be_falsey
      end
    end

    context 'When value is 0' do
      let :value do
        0
      end

      it 'Return falsey' do
        expect(subject).to be_falsey
      end
    end

    context 'When value is "false"' do
      let :value do
        'false'
      end

      it 'Return falsey' do
        expect(subject).to be_falsey
      end
    end
  end
end
