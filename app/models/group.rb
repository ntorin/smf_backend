class Group < ApplicationRecord
  has_many :group_users

  validates :identifier, format: { with: /\A[a-zA-Z0-9_]{1,16}\z/, message: 'can only contain letters, numbers, and underscores between 1-16 characters'}
  validates :name, format: { with: /\A.{1,16}\z/, message: 'must be 1-16 characters' }
  validates :description, {maximum: 500}

end
