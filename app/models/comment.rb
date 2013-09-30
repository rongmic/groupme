class Comment < ActiveRecord::Base
  belongs_to :topic, counter_cache: true
  belongs_to :user

  validates :content, presence: true

  scope :latest, ->{ limit(1) }

  def self.more
    Comment.limit(4)
  end
end
