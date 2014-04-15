class PostImage < ActiveRecord::Base
    mount_uploader :image, ImageUploader
end
