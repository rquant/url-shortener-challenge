Rails.application.routes.draw do
  root 'short_urls#home'
  resources :short_urls, only: [:create]
  
  get ':slug' => 'short_urls#redirect_to_original'
end
