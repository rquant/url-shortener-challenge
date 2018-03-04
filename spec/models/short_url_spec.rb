require 'rails_helper'

describe ShortUrl, type: :model do

  describe '.validations' do
    subject { build(:short_url) }

    it { is_expected.to validate_presence_of :slug }
    it { is_expected.to validate_uniqueness_of :slug }
    it { is_expected.to validate_length_of(:slug).is_equal_to(5) }
    it { is_expected.to validate_presence_of :original_url }
  end

  describe '#generate_slug' do
    let(:slug) { described_class.generate_slug }

    it { expect(slug).to be_instance_of(String) }
    it { expect(slug.length).to eq (5) }
  end
end
