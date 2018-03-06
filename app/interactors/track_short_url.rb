class TrackShortUrl
  include Interactor

  delegate :slug, :short_url, to: :context

  def call
    find_short_url
    track_short_url_visit
  end

  private

  def find_short_url
    unless context.short_url = ShortUrl.find_by_slug(slug)
      context.fail! message: 'Could not find URL to redirect to'
    end
  end

  def track_short_url_visit
    context.short_url.visits += 1
    context.short_url.save!
  end
end
