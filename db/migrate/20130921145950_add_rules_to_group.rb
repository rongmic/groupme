class AddRulesToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :rules, :text
  end
end
