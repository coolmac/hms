class Patient < ActiveRecord::Base
  attr_accessible :mobile, :name, :husband_name, :father_name, :age, :gender, :aadhaar_card_number, :email, :date_of_visit, :date_of_birth, :reference_mobile, :reference_name, :emergency_mobile, :emergency_name, :nationality, :occupation, :patient_type, :id_type, :id_type, :id_number, :referred_by, :insurance_provider, :insurance_policy_number

  fuzzily_searchable :name
  fuzzily_searchable :mobile
  fuzzily_searchable :email



end
