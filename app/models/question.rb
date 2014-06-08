class Question < ActiveRecord::Base
  attr_accessible :title, :sub_category, :category, :super_category, :enabled

end
