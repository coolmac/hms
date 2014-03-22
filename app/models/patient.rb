class Patient < ActiveRecord::Base
  attr_accessible :mobile, :name, :husband_name, :father_name, :age, :gender, :aadhaar_card_number, :date_of_visit, :email

  fuzzily_searchable :name
  fuzzily_searchable :mobile
  fuzzily_searchable :email



end
