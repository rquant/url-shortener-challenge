class ShortUrlsController < ApplicationController

  def create
    result = CreateShortUrl.call(original_url: params[:original_url])
    @short_url = result.short_url

    render 'home'
  end
end
