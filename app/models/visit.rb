class Visit < ActiveRecord::Base
  attr_accessible :admission_id, :examination_id, :follow_up_id, :history_id, :investigation_id, :patient_id, :treatment_id

  HISTORY = 'history'
  HISTORY_CLASSIFICATIONS = ["chief_complaint", "past_medical_history", "respiratory", "cardiovascular"]
  EXAMINATION = 'examination'

# Total types of history:
# :abdominal_id, :cardiovascular_id, :chief_complaint_id, :eyes_ent_id, :family_medical_history_id, :head_neck_id, :hematopoietic_id, :musculoskeletal_id, :neurology_id, :past_medical_history_id, :psychiatric_id, :reproductive_id, :respiratory_id, :systems_id, :treatment_history_id, :urinary_id



end
