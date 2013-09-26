class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :group, counter_cache: true
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :likers, through: :likes, source: :user

  validates :content, presence: true

  scope :hot, -> { order("topics_count desc") }
  scope :without_comments, ->{ order("topics_count == 0") }

  $recommend_count = 5

  def self.recommend
    Topic.order('comments_count desc').limit($recommend_count)
  end

  def self.latest_topics(user)
    user.topics.order('created_at desc').limit(20)
  end
end
