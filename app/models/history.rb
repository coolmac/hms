class History < ActiveRecord::Base
  attr_accessible :abdominal_id, :cardiovascular_id, :chief_complaint_id, :eyes_ent_id, :family_medical_history_id, :head_neck_id, :hematopoietic_id, :musculoskeletal_id, :neurology_id, :past_medical_history_id, :psychiatric_id, :reproductive_id, :respiratory_id, :systems_id, :treatment_history_id, :urinary_id
end
