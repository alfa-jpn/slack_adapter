require 'spec_helper'

describe SlackAdapter::Bases::Converters::HashConverter do

  let :converter do
    SlackAdapter::Bases::Converters::HashConverter
  end

  describe '.target' do
    subject do
      converter.target
    end

    it 'Return Hash' do
      expect(subject).to eq(Hash)
    end
  end

  describe '.convert' do
    subject do
      converter.convert(value)
    end

    context 'When value is hash' do
      let :value do
        { onsa: 'serow' }
      end

      it 'Return Hash' do
        expect(subject).to eq(onsa: 'serow')
      end
    end

    context 'When value is array' do
      let :value do
        [[:hane, 'cb400sf']]
      end

      it 'Return Hash' do
        expect(subject).to eq(hane: 'cb400sf')
      end
    end

    context 'When value is not convertable' do
      let :value do
        :ducati_ha_kowaremasen
      end

      it 'Return nil' do
        expect(subject).to be_nil
      end
    end
  end
end
