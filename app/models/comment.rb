class Comment < ActiveRecord::Base
  belongs_to :topic, counter_cache: true
  belongs_to :user

  def self.more
    Comment.order("created_at desc").limit(4)
  end
end
