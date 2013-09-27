class Group < ActiveRecord::Base
  # will_paginate config
  self.per_page = 8

  IMAGE_SIZES = {
    :default => [265, 177],
    :mini => [146, 98]
  }

  $recommend_count = 2

  belongs_to :category
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :topics
  has_many :group_users
  has_many :members, through: :group_users, source: :user

  validates :title, presence: true
  after_create :join_owner_to_group

  mount_uploader :image, ImageUploader

  def self.preview
    Group.order('topics_count desc').limit(5)
  end

  def editable_by?(user)
    user && user == owner
  end

  def join_owner_to_group
    members << owner
  end

  def self.recommend(count = '')
    Group.order("topics_count desc").limit($recommend_count)
  end

  def self.latest_groups(user)
    user.groups.order('created_at desc').limit(10)
  end
end
