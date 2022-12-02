class CreateLearningObjectivesTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :learning_objectives_topics do |t|
      t.integer :learning_objective_id, null: false
      t.integer :topic_id, null: false

      t.timestamps
    end
  end
end
