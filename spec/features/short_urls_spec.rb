require 'rails_helper'

describe 'Short URLs', type: :feature do
  before { visit root_path }

  describe 'creation' do
    def fill_form
      fill_in 'original_url', with: 'http://originalurl.com'
      click_on 'Shortify URL'
    end

    context 'original url is given' do
      let(:short_url) { ShortUrl.last }
      let(:short_url_link) do
        URI.join(Capybara.default_host, short_url.slug).to_s
      end

      it 'creates short url' do
        expect { fill_form }.to change(ShortUrl, :count).by(1)
      end

      it 'displays short url as link' do
        fill_form
        short_url = ShortUrl.last
        expect(page).to have_content("Your short URL: #{short_url_link}")
      end
    end
  end
end
