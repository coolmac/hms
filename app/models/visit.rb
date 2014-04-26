class Visit < ActiveRecord::Base
  has_many :prescriptions
  attr_accessible :chief_complaint, :description, :fms_history, :other_systems, :patient_id, :pms_history, :ps_history, :treatment_history, :gpe, :vitals, :general_examination

  HISTORY = 'history'
  EXAMINATION = 'examination'
  INVESTIGATION = 'investigation'

  
  # has_many :admissions



end
