class ShortUrlsController < ApplicationController
  def create
    result = CreateShortUrl.call(original_url: params[:original_url])
    @short_url = result.short_url

    render :home
  end

  def redirect_to_original
    if short_url = ShortUrl.find_by_slug(params[:slug])
      redirect_to short_url.original_url
    else
      flash.now[:error] = 'Unable to find URL to redirect to'
      render :home
    end
  end
end
