require 'rails_helper'

describe CreateShortUrl do
  let(:original_url) { 'www.example.com/originalpath' }
  let(:context) { described_class.call(original_url: original_url) }

  context 'url provided is valid' do
    it 'succeeds' do
      expect(context).to be_a_success
    end

    it 'creates short url' do
      expect { context }.to change(ShortUrl, :count).by(1)
    end

    it 'creates short url' do
      
    end
  end
end
