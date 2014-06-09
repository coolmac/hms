class Investigation < ActiveRecord::Base
  attr_accessible :category, :title, :normal_max, :normal_min, :sub_category, :units, :enabled
end
