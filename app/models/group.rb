class Group < ActiveRecord::Base
  has_many :topics
  validates :title, presence: true
  mount_uploader :image, ImageUploader
end
