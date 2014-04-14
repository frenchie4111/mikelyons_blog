class CreateAdminActions < ActiveRecord::Migration
  def change
    create_table :admin_actions do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
