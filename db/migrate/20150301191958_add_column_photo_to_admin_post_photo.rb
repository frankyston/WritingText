class AddColumnPhotoToAdminPostPhoto < ActiveRecord::Migration
	def self.up
		add_attachment :admin_post_photos, :photo
	end

	def self.down
		remove_attachment :admin_post_photos, :photo
	end
end
