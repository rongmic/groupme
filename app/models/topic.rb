class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :group, counter_cache: true
  has_many :comments
  validates :content, presence: true
end
