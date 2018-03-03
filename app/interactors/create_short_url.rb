class CreateShortUrl
  include Interactor

  delegate :original_url, to: :context

  def call
    create_short_url
  end

  private

  def create_short_url
    key = ShortUrl.generate_key
    ShortUrl.create!(key: key, original_url: original_url)
  end
end
