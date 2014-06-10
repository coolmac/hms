# == Schema Information
#
# Table name: medicines
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Medicine < ActiveRecord::Base
  attr_accessible :name
end
