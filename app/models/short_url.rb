class ShortUrl < ApplicationRecord
  RADIX = 36.freeze
  KEY_LENGTH = 5.freeze

  validates :key, presence: true, uniqueness: true, length: {is: 5}
  validates :original_url, presence: true

  def self.generate_key
    loop do
      key = rand(RADIX ** KEY_LENGTH).to_s(RADIX)
      break key unless where(key: key).exists?
    end
  end
end
