class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :group, counter_cache: true
  has_many :comments
  has_many :likes
  has_many :likers, through: :likes, source: :user

  validates :content, presence: true

  scope :hot, -> { order("topics_count desc") }
  scope :without_comments, ->{ order("topics_count == 0") }
end
