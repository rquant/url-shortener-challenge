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
end
