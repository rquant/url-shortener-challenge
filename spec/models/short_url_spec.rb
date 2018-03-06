require 'rails_helper'

describe ShortUrl, type: :model do

  describe '.validations' do
    subject { build(:short_url) }

    it { is_expected.to validate_presence_of :slug }
    it { is_expected.to validate_uniqueness_of :slug }
    it { is_expected.to validate_length_of(:slug).is_equal_to(5) }
    it { is_expected.to validate_presence_of :original_url }
    it { is_expected.to allow_value('http://foo.com').for(:original_url) }

    describe 'original url format is ivalid' do
      let(:short_url) { build(:short_url, original_url: 'www.foo.com') }
      before { short_url.valid? }

      it 'has correct error' do
        msg = I18n.t('activerecord.errors.models.short_url.attributes.original_url.invalid')
        expect(short_url.errors.full_messages.last).to include("Original url #{msg}")
      end
    end
  end

  describe '#generate_slug' do
    let(:slug) { described_class.generate_slug }

    it { expect(slug).to be_instance_of(String) }
    it { expect(slug.length).to eq (5) }
  end
end
