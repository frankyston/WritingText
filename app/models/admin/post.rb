class Admin::Post < ActiveRecord::Base
  belongs_to :admin_category, :foreign_key=>"admin_category_id", :class_name=>Admin::Category
end
