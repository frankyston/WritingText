class CreateAdminPostTags < ActiveRecord::Migration
  def change
    create_table :admin_post_tags do |t|
      t.references :admin_post, index: true
      t.references :admin_tag, index: true

      t.timestamps null: false
    end
    add_foreign_key :admin_post_tags, :admin_posts
    add_foreign_key :admin_post_tags, :admin_tags
  end
end
