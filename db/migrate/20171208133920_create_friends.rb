class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.integer :friend_one
      t.integer :friend_two
      t.boolean :is_accepted

      t.timestamps
    end
  end
end
