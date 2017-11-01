class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.integer :creator_id
      t.string :handle
      t.string :name
      t.text :description
      t.integer :member_count
      t.integer :topic_count
      t.integer :post_count
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
