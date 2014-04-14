class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title
      t.text :subject
      t.text :content
      t.timestamp :posted

      t.timestamps
    end
  end
end
