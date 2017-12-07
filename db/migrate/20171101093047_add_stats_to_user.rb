class AddStatsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :identifier, :string
    add_column :users, :name, :string
    add_column :users, :blurb, :string
    add_column :users, :birthday, :date
    add_column :users, :follower_count, :integer
    add_column :users, :following_count, :integer
    add_column :users, :friend_count, :integer
    add_column :users, :credits, :integer
    add_column :users, :credit_multiplier, :integer
    add_column :users, :total_likes, :integer
    add_column :users, :total_dislikes, :integer
    add_column :users, :topic_count, :integer
    add_column :users, :post_count, :integer
    add_column :users, :group_count, :integer
    add_column :users, :accepted_tos, :boolean
    add_column :users, :verified, :boolean
  end
end
