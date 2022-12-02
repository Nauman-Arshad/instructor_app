class AddTotalTimeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :total_time, :string
  end
end
