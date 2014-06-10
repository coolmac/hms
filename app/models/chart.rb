# == Schema Information
#
# Table name: charts
#
#  id         :integer          not null, primary key
#  tag        :string(255)
#  name       :string(255)
#  xvalue     :date
#  yvalue     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Chart < ActiveRecord::Base
  attr_accessible :name, :tag, :xvalue, :yvalue
end
