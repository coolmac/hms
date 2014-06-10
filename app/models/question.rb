# == Schema Information
#
# Table name: questions
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  sub_category   :string(255)
#  category       :string(255)
#  super_category :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  enabled        :integer
#

class Question < ActiveRecord::Base
  attr_accessible :title, :sub_category, :category, :super_category, :enabled

end
