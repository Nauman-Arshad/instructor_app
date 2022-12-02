class AddMapTopicToTopic < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :map_topics, :integer, default: 0
  end
end
