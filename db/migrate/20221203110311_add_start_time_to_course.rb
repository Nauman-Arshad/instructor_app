class AddStartTimeToCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :start_time, :time
    add_column :courses, :end_time, :time
    add_column :courses, :days, :text, array: true, default: []
    remove_column :courses, :time, :datetime
    remove_column :courses, :class_timings, :string

  end
end
