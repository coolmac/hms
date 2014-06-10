# == Schema Information
#
# Table name: patients
#
#  id                      :integer          not null, primary key
#  first_name              :string(255)
#  last_name               :string(255)
#  mobile                  :string(255)
#  husband_name            :string(255)
#  father_name             :string(255)
#  age                     :integer
#  gender                  :string(255)
#  middle_name             :string(255)
#  date_of_birth           :date
#  reference_mobile        :string(255)
#  reference_name          :string(255)
#  emergency_mobile        :string(255)
#  emergency_name          :string(255)
#  nationality             :string(255)
#  occupation              :string(255)
#  patient_type            :string(255)
#  id_type                 :string(255)
#  id_number               :string(255)
#  referred_by             :string(255)
#  insurance_provider      :string(255)
#  insurance_policy_number :string(255)
#  religion                :string(255)
#  email                   :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  uhid                    :string(255)
#  registration_time       :date
#

class Patient < ActiveRecord::Base
  attr_accessible :mobile, :first_name, :middle_name, :last_name, :husband_name, :father_name, :age, :gender, :aadhaar_card_number, :email, :date_of_visit, :date_of_birth, :reference_mobile, :reference_name, :emergency_mobile, :emergency_name, :nationality, :occupation, :patient_type, :id_type, :id_type, :id_number, :referred_by, :insurance_provider, :insurance_policy_number, :religion, :address_attributes, :uhid, :registration_time

  fuzzily_searchable :first_name
  fuzzily_searchable :last_name
  fuzzily_searchable :mobile
  fuzzily_searchable :email
  fuzzily_searchable :uhid

  has_one :address, :dependent => :destroy
  accepts_nested_attributes_for :address
  has_many :visits
  after_create :set_uhid_for_patient

  def set_uhid_for_patient
  	today = Date.today.strftime("%Y%m%d")
  	self.uhid = "#{APP_CONFIG[:uhid_prefix]}#{today}#{APP_CONFIG[:sequence]}#{self.id}"
  	self.save!
  end


end
