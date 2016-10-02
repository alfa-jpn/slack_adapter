require 'spec_helper'

describe SlackAdapter::Requester do
  describe '.request!' do
    subject do
      SlackAdapter::Requester.request! method, params
    end

    before :each do
      SlackAdapter.configure { |config| config.token = token }
      stub_request(:get, /#{SlackAdapter.config.api_url}\/.*/).to_return(status: 200, body: result.to_json)
    end

    let :method do
      'baku.on'
    end

    let :params do
      { suzunoki_rin: 'GSX400S KATANA' }
    end

    let :token do
      'ride-on!'
    end

    let :result do
      { ok: true }
    end

    it 'Request to slack' do
      subject
      expect(a_request(:get, "#{SlackAdapter.config.api_url}/#{method}")
                 .with(query: params.merge(token: token))).to have_been_made.once
    end

    it 'Return hash' do
      expect(subject).to eq('ok' => true)
    end

    context 'When result has error' do
      let :result do
        { ok: false, error: 'suzuki no baikuha sekai 1.' }
      end

      it 'Raise RequestException' do
        expect { subject }.to raise_error(SlackAdapter::Requester::RequestException, 'suzuki no baikuha sekai 1.')
      end
    end

    context 'When token has not been uninitialized' do
      let :token do
        nil
      end

      it 'Raise RequestException' do
        expect { subject }.to raise_error(SlackAdapter::Requester::RequestException, 'SlackAdapter.configs.token was not set.')
      end
    end

    context 'When raise error' do
      before :each do
        allow(Net::HTTP).to receive(:get).and_raise('moja no bike hakken!')
      end

      it 'Raise RequestException' do
        expect { subject }.to raise_error(SlackAdapter::Requester::RequestException, 'moja no bike hakken!')
      end
    end
  end
end
