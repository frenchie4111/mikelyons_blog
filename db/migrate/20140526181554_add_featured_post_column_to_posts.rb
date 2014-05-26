class AddFeaturedPostColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :featured, :boolean, :default => false
  end
end
