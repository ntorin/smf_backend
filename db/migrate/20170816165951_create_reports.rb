class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer :reporter_id
      t.integer :culprit_id
      t.string :reason
      t.text :comment

      t.timestamps
    end
  end
end
