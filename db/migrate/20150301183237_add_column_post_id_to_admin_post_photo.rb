class AddColumnPostIdToAdminPostPhoto < ActiveRecord::Migration
  def change
    add_reference :admin_post_photos, :admin_post, index: true
    add_foreign_key :admin_post_photos, :admin_posts
  end
end
