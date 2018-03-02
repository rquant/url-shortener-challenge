class ShortUrl < ApplicationRecord
  RADIX = 36.freeze
  KEY_LENGTH = 5.freeze

  def self.generate_key
    rand(RADIX ** KEY_LENGTH).to_s(RADIX)
  end
end
