class AddAvailableDaysToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :days, :text, array: true, default: []
  end
end
