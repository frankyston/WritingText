class Admin::Post < ActiveRecord::Base
	attr_accessor :tag
  belongs_to :admin_category, :foreign_key=>"admin_category_id", :class_name=>Admin::Category
  has_many :post_tags, :foreign_key=>"admin_post_id", :class_name=>Admin::PostTag
  has_many :tags, :through => :post_tags
  has_many :photos, :foreign_key=>"admin_post_id", :class_name=>Admin::PostPhoto

  before_save :permalink

  def permalink
  	self.link = self.name.parameterize
  end
end
