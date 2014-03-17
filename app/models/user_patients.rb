class UserPatients < ActiveRecord::Base
  attr_accessible :patient_id, :user_id

  belongs_to :user
  belongs_to :patient
  
end
