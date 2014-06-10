# == Schema Information
#
# Table name: prescription_medicines
#
#  id                        :integer          not null, primary key
#  favourite_prescription_id :integer
#  medicine                  :string(255)
#  frequency                 :string(255)
#  duration                  :string(255)
#  route                     :string(255)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class PrescriptionMedicine < ActiveRecord::Base
  belongs_to :favourite_prescription
  attr_accessible :duration, :frequency, :medicine, :route, :favourite_prescription_id
end
