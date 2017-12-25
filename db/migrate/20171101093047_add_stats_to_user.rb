class AddStatsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :identifier, :string
    add_index :users, :identifier, unique: true
    add_column :users, :name, :string
    add_column :users, :role, :string, default: 'user'
    add_column :users, :blurb, :string
    add_column :users, :birthday, :date
    add_column :users, :follower_count, :integer, default: 0
    add_column :users, :following_count, :integer, default: 0
    add_column :users, :friend_count, :integer, default: 0
    add_column :users, :credits, :integer, default: 0
    add_column :users, :credit_multiplier, :integer, default: 1
    add_column :users, :total_likes, :integer, default: 0
    add_column :users, :total_dislikes, :integer, default: 0
    add_column :users, :topic_count, :integer, default: 0
    add_column :users, :post_count, :integer, default: 0
    add_column :users, :group_count, :integer, default: 0
    add_column :users, :accepted_tos, :boolean, default: false
    add_column :users, :verified, :boolean, default: false
    add_column :users, :is_banned, :boolean, default: false
  end
end
