Rails.application.routes.draw do
  resources :users
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
  resources :users

  post 'topics/fetch', to: 'topics#fetch'

  post 'groups/fetch', to: 'groups#fetch'

  post 'posts/fetch', to: 'posts#fetch'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
