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

  post 'friends/accept_request', to: 'friends#accept_request'

  post 'groups/fetch', to: 'groups#fetch'
  post 'groups/validate_identifier', to: 'groups#validate_identifier'

  post 'posts/fetch', to: 'posts#fetch'

  post 'topics/fetch', to: 'topics#fetch'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
