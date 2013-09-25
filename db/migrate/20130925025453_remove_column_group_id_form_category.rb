class RemoveColumnGroupIdFormCategory < ActiveRecord::Migration
  def up
    remove_column :categories, :group_id, :integer
  end

  def down
    add_column :categories, :group_id, :integer
  end
end
