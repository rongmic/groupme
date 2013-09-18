class ResetTopicsCountInGroups < ActiveRecord::Migration
  def self.up
    Group.find_each do |g|
      Group.reset_counters(g.id, :topics)
    end
  end
end
