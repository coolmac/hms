class Visit < ActiveRecord::Base
  attr_accessible :admission_id, :examination_id, :follow_up_id, :history_id, :investigation_id, :patient_id, :treatment_id
end
