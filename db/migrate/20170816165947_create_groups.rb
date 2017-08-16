class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.integer :user_id
      t.string :name
      t.string :handle
      t.text :description
      t.integer :members
      t.integer :posts

      t.timestamps
    end
  end
end
