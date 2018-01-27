class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :topics

  validates :identifier, format: { with: /\A[a-zA-Z0-9_]{1,16}\z/, message: 'can only contain letters, numbers, and underscores between 1-16 characters'}

  ROLES = %w[user moderator admin superadmin]
  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

end
