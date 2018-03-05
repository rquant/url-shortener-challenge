require 'rails_helper'

describe ShortUrlsController, type: :controller do
  describe 'POST create' do
    let(:params) { {original_url: 'http://example.com'} }
    let(:short_url) { create(:short_url) }
    let(:interactor) { CreateShortUrl }
    let(:context) { double(:context, success?: true, short_url: short_url) }


    before { allow(interactor).to receive(:call).and_return(context) }
    before { post :create, params }

    it { is_expected.to render_template(:home) }

    it 'call interactor with correct params' do
      expect(interactor).to have_received(:call).with(params)
    end
  end

  describe 'GET redirect_to_original' do
    let(:short_url) { create(:short_url) }
    let(:original_url) { short_url.original_url }

    before { get :redirect_to_original, slug: slug }

    context 'slug belongs to short url' do
      let(:slug) { short_url.slug }

      it { is_expected.to redirect_to(original_url) }
    end

    context 'slug is not found' do
      let(:slug) { 'wrong_slug' }

      it { is_expected.to render_template(:home) }

      it 'sets flash error' do
        expect(flash[:error]).to be_present
      end
    end
  end
end
