class AddLocationToCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :location, :string
    add_column :courses, :time, :datetime
  end
end
