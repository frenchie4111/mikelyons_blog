class RenameImageIdToPostImageId < ActiveRecord::Migration
  def change
    rename_column :posts, :image_id, :post_image_id
  end
end
