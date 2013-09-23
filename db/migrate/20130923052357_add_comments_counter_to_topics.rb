class AddCommentsCounterToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :comments_count, :integer, default: 0

    Topic.find_each do |t|
      Topic.reset_counters(t.id, :comments)
    end
  end
end
