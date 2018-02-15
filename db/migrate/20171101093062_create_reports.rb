class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer :group_id
      t.integer :reporter_id
      t.integer :reported_id
      t.string :reason
      t.text :comment
      t.boolean :is_closed

      t.timestamps
    end
  end
end
