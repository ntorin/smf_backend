class AddStatsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :identifier, :string
    add_index :users, :identifier, unique: true
    add_column :users, :name, :string
    add_column :users, :role, :string, default: 'user'
    add_column :users, :blurb, :string
    add_column :users, :birthday, :date
    add_column :users, :referral_count, :integer, default: 0
    add_column :users, :follower_count, :integer, default: 0
    add_column :users, :following_count, :integer, default: 0
    add_column :users, :friend_count, :integer, default: 0
    add_column :users, :credits, :bigint, default: 0
    add_column :users, :credit_multiplier, :integer, default: 1
    add_column :users, :total_likes, :integer, default: 0
    add_column :users, :total_dislikes, :integer, default: 0

    add_column :users, :topic_count, :integer, default: 0
    add_column :users, :post_count, :integer, default: 0
    add_column :users, :group_count, :integer, default: 0
    add_column :users, :daily_post_count, :integer, default: 0
    add_column :users, :weekly_post_count, :integer, default: 0
    add_column :users, :monthly_post_count, :integer, default: 0

    add_column :users, :is_post_history_private, :boolean, default: false
    add_column :users, :is_friends_private, :boolean, default: false
    add_column :users, :is_groups_private, :boolean, default: false
    add_column :users, :is_post_count_private, :boolean, default: false
    add_column :users, :is_join_date_private, :boolean, default: false
    add_column :users, :is_dark_theme, :boolean, default: false

    add_column :users, :name_color, :string, default: ''

    add_column :users, :accepted_tos, :boolean, default: false
    add_column :users, :verified, :boolean, default: false
    add_column :users, :is_banned, :boolean, default: false
  end
end
