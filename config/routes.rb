Rails.application.routes.draw do
  resources :referrals
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

  mount ActionCable.server => '/cable'

  mount_devise_token_auth_for 'User', at: 'auth'

  post 'users/fetch', to: 'users#fetch'
  post 'users/validate_identifier', to: 'users#validate_identifier'

  post 'conversations/fetch', to: 'conversations#fetch'

  post 'conversation_messages/fetch', to: 'conversation_messages#fetch'

  post 'credit_histories/fetch', to: 'credit_histories#fetch'

  post 'feeds/fetch', to: 'feeds#fetch'

  post 'follows/check_request', to: 'follows#check_request'
  post 'follows/fetch', to: 'follows#fetch'
  post 'follows/my_follows', to: 'follows#my_follows'

  post 'friends/check_request', to: 'friends#check_request'
  post 'friends/accept_request', to: 'friends#accept_request'
  post 'friends/fetch', to: 'friends#fetch'

  post 'groups/fetch', to: 'groups#fetch'
  post 'groups/validate_identifier', to: 'groups#validate_identifier'
  post 'groups/my_groups', to: 'groups#my_groups'

  post 'group_users/fetch', to: 'group_users#fetch'
  post 'group_users/check_request', to: 'group_users#check_request'

  post 'notifications/fetch', to: 'notifications#fetch'

  post 'posts/fetch', to: 'posts#fetch'

  post 'referrals/check_user', to: 'referrals#check_user'

  post 'topics/fetch', to: 'topics#fetch'
end