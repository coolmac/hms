class AdmitDay < ActiveRecord::Base
  belongs_to :admission
  attr_accessible :admit_date, :care_giver_notes, :doctor_notes, :nurse_notes, :serial_number, :treatment
  validate :validate_admission_dates
  validates :serial_number, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  def validate_admission_dates
  	admission = self.admission
  	associated_admit_days = admission.admit_days

  	#Replace self if it's not a new record
  	if self.new_record?
	  associated_admit_days << self
  	else
	  associated_admit_days.each_with_index do |aad, index|
	  	if aad.id == self.id
	  	  associated_admit_days[index] = self
	  	end
	  end
  	end

  	ads_sorted_by_serial_number = associated_admit_days.sort_by { |a| a.serial_number }
  	ads_sorted_by_admit_date = associated_admit_days.sort_by { |a| a.admit_date}

  	if (ads_sorted_by_admit_date == ads_sorted_by_serial_number)
  		# no error
  		return true
  	else
  		errors.add(:base, "Admit Date doesn't follow the order of entry day")
  		return false
  	end
  end

end
