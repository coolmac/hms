# == Schema Information
#
# Table name: prescriptions
#
#  id         :integer          not null, primary key
#  visit_id   :integer
#  medicine   :string(255)
#  frequency  :string(255)
#  duration   :string(255)
#  route      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Prescription < ActiveRecord::Base
  belongs_to :visit
  attr_accessible :duration, :frequency, :medicine, :route
end
