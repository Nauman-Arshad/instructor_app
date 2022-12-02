class AddCategoryToLearningObjective < ActiveRecord::Migration[6.0]
  def change
    add_column :learning_objectives, :category, :integer, default: 0
  end
end
