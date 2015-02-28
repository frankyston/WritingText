class CreateAdminPosts < ActiveRecord::Migration
  def change
    create_table :admin_posts do |t|
      t.string :name
      t.text :resume
      t.text :message
      t.references :admin_category, index: true

      t.timestamps null: false
    end
    add_foreign_key :admin_posts, :admin_categories
  end
end
