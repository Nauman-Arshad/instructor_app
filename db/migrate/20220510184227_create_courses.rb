class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.integer :credit_hours, null: false
      t.string :class_timings, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
