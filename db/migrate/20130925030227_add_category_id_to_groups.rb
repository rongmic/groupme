class AddCategoryIdToGroups < ActiveRecord::Migration
  def up
    add_column :groups, :category_id, :integer
  end

  def down
    remove_column :groups, :category_id, :integer
  end
end
