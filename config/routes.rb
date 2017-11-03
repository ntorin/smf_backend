Rails.application.routes.draw do
  resources :post_likes
  resources :posts
  resources :reports
  resources :notifications
  resources :topic_tags
  resources :topics
  resources :group_tags
  resources :groups
  resources :feeds
  resources :conversation_users
  resources :conversations
  resources :private_messages
  resources :blocks
  resources :follows
  resources :friends
  resources :credit_histories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
