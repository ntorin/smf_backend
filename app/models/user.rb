class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User
  after_update emit_update

  has_many :topics

  validates :identifier, format: { with: /\A[a-zA-Z0-9_]{1,16}\z/, message: 'can only contain letters, numbers, and underscores between 1-16 characters'}, allow_blank: true
  validates :name, format: { with: /\A.{1,16}\z/, message: 'must be 1-16 characters' }, allow_blank: true

  def self.reset_daily_posts
    User.update_all(daily_post_count: 0)
  end

  def self.reset_weekly_posts
    User.update_all(weekly_post_count: 0)
  end

  def self.reset_monthly_posts
    User.update_all(monthly_post_count: 0)
  end

  def emit_update
    ActionCable.server.broadcast("profile_#{self.id}", {user: user, action: 'profile_update'})
  end

  ROLES = %w[user moderator admin superadmin]
  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

end
