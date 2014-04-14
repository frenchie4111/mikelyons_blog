class RemovePostedColumnFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :posted
  end
end
