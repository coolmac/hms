class AdmitDay < ActiveRecord::Base
  belongs_to :admission
  attr_accessible :admit_date, :care_giver_notes, :doctor_notes, :nurse_notes, :serial_number, :treatment
end
