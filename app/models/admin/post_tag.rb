class Admin::PostTag < ActiveRecord::Base
  belongs_to :post, :foreign_key=>"admin_post_id", :class_name=>Admin::Post
  belongs_to :tag, :foreign_key=>"admin_tag_id", :class_name=>Admin::Tag
end
