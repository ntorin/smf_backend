class CreateGrapevineMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :grapevine_messages do |t|
      t.integer :user_id
      t.string :name
      t.integer :group_id
      t.string :message
      t.boolean :is_anonymous

      t.timestamps
    end
  end
end
