class ShortUrlsController < ApplicationController
  def create
    result = CreateShortUrl.call(original_url: params[:original_url])

    if result.success?
      @short_url = result.short_url
    else
      flash.now[:error] = result.message
    end
    render :home
  end

  def redirect_to_original
    result = TrackShortUrl.call(slug: params[:slug])

    if result.success?
      short_url = result.short_url
      redirect_to short_url.original_url
    else
      flash.now[:error] = result.message
      render :home
    end
  end
end
