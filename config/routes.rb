Rails.application.routes.draw do
  root 'short_urls#home'

  get '/short_urls', to: redirect('/')
  post '/short_urls' => 'short_urls#create'

  get ':slug' => 'short_urls#redirect_to_original'
end
