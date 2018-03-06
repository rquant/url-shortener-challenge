require 'rails_helper'

describe ShortUrlsController, type: :controller do
  let(:short_url) { create(:short_url) }
  let(:original_url) { short_url.original_url }
  let(:slug) { short_url.slug }

  describe 'POST create' do
    let(:params) { {original_url: 'http://example.com'} }
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
    let(:params) { {slug: slug} }
    let(:interactor) { TrackShortUrl }

    before { allow(interactor).to receive(:call).and_return(context) }
    before { get :redirect_to_original, slug: slug }

    context 'when success' do
      let(:context) { double(:context, success?: true, short_url: short_url) }

      it { is_expected.to redirect_to(original_url) }
    end

    context 'when failed' do
      let(:context) { double(:context, success?: false, message: 'failed') }

      it { is_expected.to render_template(:home) }

      it 'sets flash error' do
        expect(flash[:error]).to be_present
      end
    end
  end
end
