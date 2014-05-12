class Visit < ActiveRecord::Base
  has_many :prescriptions
  attr_accessible :chief_complaint, :description, :fms_history, :other_systems, :patient_id, :pms_history, :ps_history, :treatment_history, :gpe, :vitals, :general_examination, :visit_time

  HISTORY = 'history'
  EXAMINATION = 'examination'
  INVESTIGATION = 'investigation'
  SUPER_CATEGORY_ORDER = [HISTORY, EXAMINATION, INVESTIGATION]
  
  HISTORY_CATEGORY= [['chief_complaint','Chief Complaint History'] , ['pms_history', 'Past Medical & Surgical History'], ['fms_history', 'Family Medical & Surgical History'], ['ps_history', 'Past Social History'], ['other_systems_history', 'Other Systems History']]
  EXAMINATION_CATEGORY= [['gpe', 'General Physical Examination'], ['vitals', 'Vitals Examination']]  
  INVESTIGATION_CATEGORY = [['lft', 'LFT']]

  CATEGORIES = {HISTORY => HISTORY_CATEGORY, EXAMINATION => EXAMINATION_CATEGORY, INVESTIGATION => INVESTIGATION_CATEGORY}
  
  #TODO set up associations
  # has_many :admissions

  def self.get_matched_index(category_map, present_super_category, present_category)
    matched_index = -1
    category_map.each_with_index do |category_info, index|
      if category_info[0] == present_category
        matched_index = index
        break
      end
    end
    return matched_index
  end

  def self.get_next_category(present_super_category, present_category)
    category_map = CATEGORIES[present_super_category]
    if category_map == nil
      return nil
    else
      matched_index = get_matched_index(category_map, present_super_category, present_category)
      if matched_index == ((category_map.size) -1)
        return category_map[matched_index]
      else
        # if no match is found, return first category
        return category_map[matched_index+1]
      end
    end
  end

  def self.get_previous_category(present_super_category, present_category)
    category_map = CATEGORIES[present_super_category]
    output_index = 0
    if category_map == nil
      return nil
    else
      # if no match is found, return first category
      matched_index = get_matched_index(category_map, present_super_category, present_category)
      if matched_index > 0
        output_index = matched_index-1
      end
    end
    return category_map[output_index]
  end

end
