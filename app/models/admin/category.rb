class Admin::Category < ActiveRecord::Base
	has_many :posts, :foreign_key=>"admin_category_id", :class_name=>Admin::Post
end
