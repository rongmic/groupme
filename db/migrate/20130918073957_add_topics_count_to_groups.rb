class AddTopicsCountToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :topics_count, :integer, default: 0
  end
end
