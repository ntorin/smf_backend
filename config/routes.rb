Rails.application.routes.draw do
  resources :group_users
  resources :friends
  resources :conversation_messages
  resources :users
  resources :post_likes
  resources :posts
  resources :reports
  resources :notifications
  resources :topics
  resources :groups
  resources :feeds
  resources :conversation_users
  resources :conversations
  resources :blocks
  resources :follows
  resources :credit_histories
  resources :users

  mount_devise_token_auth_for 'User', at: 'auth'

  post 'users/fetch', to: 'users#fetch'
  post 'users/validate_identifier', to: 'users#validate_identifier'

  post 'follows/check_request', to: 'follows#check_request'

  post 'friends/check_request', to: 'friends#check_request'
  post 'friends/accept_request', to: 'friends#accept_request'
  post 'friends/fetch', to: 'friends#fetch'

  post 'groups/fetch', to: 'groups#fetch'
  post 'groups/validate_identifier', to: 'groups#validate_identifier'

  post 'group_users/check_request', to: 'group_users#check_request'

  post 'posts/fetch', to: 'posts#fetch'

  post 'topics/fetch', to: 'topics#fetch'
end