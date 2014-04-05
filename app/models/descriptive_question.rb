class DescriptiveQuestion < ActiveRecord::Base
  attr_accessible :category, :sub_category, :super_category, :title
end
