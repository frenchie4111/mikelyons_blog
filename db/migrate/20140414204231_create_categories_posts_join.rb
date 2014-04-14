class CreateCategoriesPostsJoin < ActiveRecord::Migration
  def change
    create_table :categories_posts, :id => false do |t|
        t.column :category_id, :integer
        t.column :post_id, :integer
    end
  end
end
