class ShortUrl < ApplicationRecord
  RADIX = 36.freeze
  SLUG_LENGTH = 5.freeze

  validates :slug, presence: true, uniqueness: true, length: {is: 5}
  validates :original_url, presence: true

  def self.generate_slug
    loop do
      slug = rand(RADIX ** SLUG_LENGTH).to_s(RADIX)
      break slug unless where(slug: slug).exists?
    end
  end
end
