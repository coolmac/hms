class Patient < ActiveRecord::Base
  attr_accessible :mobile, :first_name, :middle_name, :last_name, :husband_name, :father_name, :age, :gender, :aadhaar_card_number, :email, :date_of_visit, :date_of_birth, :reference_mobile, :reference_name, :emergency_mobile, :emergency_name, :nationality, :occupation, :patient_type, :id_type, :id_type, :id_number, :referred_by, :insurance_provider, :insurance_policy_number, :religion, :address_attributes, :uhid

  fuzzily_searchable :first_name
  fuzzily_searchable :last_name
  fuzzily_searchable :mobile
  fuzzily_searchable :email
  fuzzily_searchable :uhid

  has_one :address, :dependent => :destroy
  accepts_nested_attributes_for :address
  has_many :visits
  after_create :set_uhid_for_patient, :create_visit





  def set_uhid_for_patient
  	today = Date.today.strftime("%Y%m%d")
  	self.uhid = "#{APP_CONFIG[:uhid_prefix]}#{today}#{APP_CONFIG[:sequence]}#{self.id}"
  	self.save!
  end

  def create_visit
    visit = Visit.create({:patient_id => self.id})
    # user_session[:current_visit] = visit
    # user_session[:current_visit_id] = visit.id
  end

end
