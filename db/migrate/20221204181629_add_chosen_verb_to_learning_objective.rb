class AddChosenVerbToLearningObjective < ActiveRecord::Migration[6.0]
  def change
    add_column :learning_objectives, :chosen_verb, :string
  end
end
