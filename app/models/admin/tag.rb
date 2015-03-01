class Admin::Tag < ActiveRecord::Base
	validates_uniqueness_of :name
	has_many :tag_posts, :foreign_key=>"admin_tag_id", :class_name=>Admin::PostTag
  has_many :posts, :through => :tag_posts
end



