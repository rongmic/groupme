class Group < ActiveRecord::Base

  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :topics

  validates :title, presence: true
  mount_uploader :image, ImageUploader

  def editable_by?(user)
    user && user == owner
  end
end
