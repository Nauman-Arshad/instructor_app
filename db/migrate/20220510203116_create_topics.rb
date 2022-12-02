class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.text :description, null: false
      t.integer :course_id, null: false

      t.timestamps
    end
  end
end
