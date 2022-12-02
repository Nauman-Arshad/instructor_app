class AddUniqueNumberToLearningObjective < ActiveRecord::Migration[6.0]
  def change
    add_column :learning_objectives, :key, :string, unique: true
  end
end
