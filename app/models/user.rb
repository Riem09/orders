class User < ActiveRecord::Base
  has_many :posts
  
  mount_base64_uploader :image, ImageUploader
end
