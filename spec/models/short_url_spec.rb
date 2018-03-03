require 'rails_helper'

describe ShortUrl, type: :model do

  describe '.validations' do
    subject { build(:short_url) }
  end

  describe '#generate_key' do
    let(:key) { described_class.generate_key }

    it { expect(key).to be_instance_of(String) }
    it { expect(key.length).to eq (5) }
  end
end
