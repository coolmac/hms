module AdmitDaysHelper
  
  def get_serial_number
  	entry_day_value = @admit_day.serial_number
  	
  	if !entry_day_value
	  admission = @admit_day.admission
	  existing_admit_days = admission.admit_days
	  entry_day_value = 1
	  if existing_admit_days.size > 0
	  	max_entry = existing_admit_days.max_by &:serial_number
	  	entry_day_value = max_entry.serial_number + 1
	  end
	end
  	
  	return entry_day_value	
  end

end
