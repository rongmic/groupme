class Category < ActiveRecord::Base
  has_many :groups

  def more_groups?
    self.groups.count > 5
  end
end
