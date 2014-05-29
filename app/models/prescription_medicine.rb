class PrescriptionMedicine < ActiveRecord::Base
  belongs_to :favourite_prescription
  attr_accessible :duration, :frequency, :medicine, :route, :favourite_prescription_id
end
