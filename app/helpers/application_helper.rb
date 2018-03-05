module ApplicationHelper
  def short_url_link(short_url)
    uri = URI.join root_url, short_url.slug
    uri.to_s
  end
end
