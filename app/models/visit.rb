class Visit < ActiveRecord::Base
  attr_accessible :chief_complaint, :description, :fm_history, :other_systems, :patient_id, :pms_history, :ps_history, :treatment_history
end
