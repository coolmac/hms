# == Schema Information
#
# Table name: descriptive_questions
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  sub_category   :string(255)
#  category       :string(255)
#  super_category :string(255)
#  enabled        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class DescriptiveQuestion < ActiveRecord::Base
  attr_accessible :category, :sub_category, :super_category, :title, :enabled
end
