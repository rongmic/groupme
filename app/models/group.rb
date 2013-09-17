class Group < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
