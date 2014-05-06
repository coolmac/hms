class Visit < ActiveRecord::Base
  has_many :prescriptions
  attr_accessible :chief_complaint, :description, :fms_history, :other_systems, :patient_id, :pms_history, :ps_history, :treatment_history, :gpe, :vitals, :general_examination

  HISTORY = 'history'
  EXAMINATION = 'examination'
  INVESTIGATION = 'investigation'
  HISTORY_CATEGORY= [['chief_complaint','Chief Complaint History'] , ['pms_history', 'Past Medical & Surgical History'], ['fms_history', 'Family Medical & Surgical History'], ['ps_history', 'Past Social History'], ['other_systems_history', 'Other Systems History']]
  EXAMINATION_CATEGORY= [['gpe', 'General Physical Examination'], ['vitals', 'Vitals Examination']]  
  # CATEGORIES = {HISTORY => HISTORY_CATEGORY, EXAMINATION => EXAMINATION_CATEGORY}
  INVESTIGATION_CATEGORY = [['lft', 'LFT']]
  # has_many :admissions



end
