# == Schema Information
#
# Table name: investigations
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  units        :string(255)
#  normal_min   :string(255)
#  normal_max   :string(255)
#  sub_category :string(255)
#  category     :string(255)
#  enabled      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Investigation < ActiveRecord::Base
  attr_accessible :category, :title, :normal_max, :normal_min, :sub_category, :units, :enabled
end
