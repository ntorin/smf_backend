class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.integer :user_id
      t.string :identifier, unique: true
      t.string :name
      t.text :description
      t.string :group_type, default: 'public'
      t.string :tags, default: ''

      t.integer :member_count, default: 0
      t.integer :topic_count, default: 0
      t.integer :post_count, default: 0

      t.boolean :is_anonymous, default: false
      t.boolean :is_nsfw, default: false

      t.decimal :lat, {:precision=>10, :scale=>6}, default: 0
      t.decimal :lng, {:precision=>10, :scale=>6}, default: 0

      t.timestamps

    end
  end
end
