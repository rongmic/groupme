class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :groups
  has_many :topics
  has_many :group_users
  has_many :participated_groups, through: :group_users, source: :group
  has_many :comments
  has_many :likes
  has_many :liked_topics, through: :likes, source: :topic

  mount_uploader :avatar, ImageUploader

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  scope :latest, -> { order('created_at desc').limit(8) }

  validates :username, presence: true

  def join!(group)
    participated_groups << group
  end

  def quit!(group)
    participated_groups.delete(group)
  end

  def is_member_of?(group)
    participated_groups.include?(group)
  end

  def like(topic)
    liked_topics << topic
  end

  def dislike(topic)
    liked_topics.delete(topic)
  end

end
