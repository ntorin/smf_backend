Rails.application.routes.draw do
  resources :topics
  resources :reports
  resources :notifications
  resources :private_messages
  resources :posts
  resources :groups
  resources :feeds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
