class ShortUrl < ApplicationRecord
  RADIX = 36.freeze
  KEY_LENGTH = 5.freeze

  validates :key, presence: true, uniqueness: true, length: { is: 5 }
  validates :original_url, presence: true

  def self.generate_key
    rand(RADIX ** KEY_LENGTH).to_s(RADIX)
  end
end
