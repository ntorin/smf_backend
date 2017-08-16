class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :topic_id
      t.text :message

      t.timestamps
    end
  end
end
