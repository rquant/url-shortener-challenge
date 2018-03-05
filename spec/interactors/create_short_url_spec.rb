require 'rails_helper'

describe CreateShortUrl do
  let(:context) { described_class.call(original_url: original_url) }

  context 'url provided is valid' do
    let(:original_url) { 'http://example.com' }

    it 'succeeds' do
      expect(context).to be_a_success
    end

    it 'creates short url' do
      expect { context }.to change(ShortUrl, :count).by(1)
    end
  end

  context 'url provided is invalid' do
    let(:original_url) { 'www.example.com' }

    it 'fails' do
      expect(context).to be_a_failure
    end

    it 'does not create short url' do
      expect { context }.not_to change(ShortUrl, :count)
    end
  end
end
