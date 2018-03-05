Rails.application.routes.draw do
  root 'short_urls#home'
  resources :short_urls, only: [:create]
end
