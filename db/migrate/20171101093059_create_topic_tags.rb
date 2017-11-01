class CreateTopicTags < ActiveRecord::Migration[5.0]
  def change
    create_table :topic_tags do |t|
      t.integer :topic_id
      t.string :name

      t.timestamps
    end
  end
end
