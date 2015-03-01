class CreateAdminPostPhotos < ActiveRecord::Migration
  def change
    create_table :admin_post_photos do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
