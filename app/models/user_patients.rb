class UserPatients < ActiveRecord::Base
  attr_accessible :patient_id, :user_id
end
