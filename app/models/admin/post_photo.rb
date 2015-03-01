class Admin::PostPhoto < ActiveRecord::Base
	belongs_to :post, :foreign_key=>"admin_post_id",:class_name=>Admin::Post
	has_attached_file :photo, :styles => { :medium => "800x600>", :thumb => "400x200>" }, :default_url => "/images/:style/missing.png"
end
