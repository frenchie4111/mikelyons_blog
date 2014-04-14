class CategoryFixtures < ActiveRecord::Migration
  def up
    categories = 
        [ { name: "Projects" } ]

    categories.each do |category|
        Category.create( category )
    end
  end
end
