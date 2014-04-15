class PostImage < ActiveRecord::Base
    mount_uploader :image, ImageUploader

    has_many :posts

    before_destroy :remove_links

    private
        def remove_links
            self.posts.each do |post|
                post.post_image_id = nil
                post.save()
            end
        end
end
