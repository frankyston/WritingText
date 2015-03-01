class AddColumnPermalinkToAdminPost < ActiveRecord::Migration
  def change
    add_column :admin_posts, :link, :string
  end
end
