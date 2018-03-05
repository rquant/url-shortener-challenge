class CreateShortUrl
  include Interactor

  delegate :original_url, :short_url, to: :context

  def call
    context.short_url = create_short_url
  end

  private

  def create_short_url
    slug = ShortUrl.generate_slug
    ShortUrl.create!(slug: slug, original_url: original_url)
  end
end
