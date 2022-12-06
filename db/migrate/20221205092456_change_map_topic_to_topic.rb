class ChangeMapTopicToTopic < ActiveRecord::Migration[6.0]
  def change
    remove_column :topics, :map_topics, :integer, default: 0
    add_column :topics, :map_topics, :string, array: true, default: []
  end
end
