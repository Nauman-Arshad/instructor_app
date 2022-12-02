class CreateLearningObjectives < ActiveRecord::Migration[6.0]
  def change
    create_table :learning_objectives do |t|
      t.text :description, null: false
      t.integer :course_id, null: false
      t.integer :bloom_taxonomy_level_id, null: false
      t.integer :bloom_taxonomy_verb_id, null: false

      t.timestamps
    end
  end
end
