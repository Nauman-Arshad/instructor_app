class AddStartAndEndTimeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :office_hours_up, :datetime
    add_column :users, :office_hours_to, :datetime
    remove_column :users, :office_hours, :string
  end
end
