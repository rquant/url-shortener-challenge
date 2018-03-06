require 'rails_helper'

describe TrackShortUrl do
  let(:short_url) { create(:short_url) }
  let(:context) { described_class.call(slug: slug) }

  context 'slug belongs to short url' do
    let(:slug) { short_url.slug }

    it 'succeeds' do
      expect(context).to be_a_success
    end

    it 'tracks visit' do
      expect { context }.to change { short_url.reload.visits }.by(1)
    end
  end

  context 'slug is not found' do
    let(:slug) { 'wrong-slug' }

    it 'fails' do
      expect(context).to be_a_failure
    end

    it 'returns correct error' do
      expect(context.message).to eq 'Could not find URL to redirect to'
    end
  end
end
