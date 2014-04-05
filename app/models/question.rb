class Question < ActiveRecord::Base
  attr_accessible :title, :sub_category, :category, :super_category, :answer_type

end
