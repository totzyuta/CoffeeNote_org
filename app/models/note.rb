class Note < ActiveRecord::Base
  belongs_to :user
  mount_uploader :coffee_image1, ImageUploader
end
