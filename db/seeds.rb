# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def populate_chief_complaint_questions
  chief_complaint_descriptive_questions = DescriptiveQuestion.create_or_update([
  	{title: 'Symptom', sub_category: 'chief_complaint', category: 'chief_complaint', super_category: 'history'},
  	{title: 'Onset', sub_category: 'chief_complaint', category: 'chief_complaint', super_category: 'history'},
  	{title: 'Duration', sub_category: 'chief_complaint', category: 'chief_complaint', super_category: 'history'},
  	{title: 'Course', sub_category: 'chief_complaint', category: 'chief_complaint', super_category: 'history'},
  	{title: 'Severity', sub_category: 'chief_complaint', category: 'chief_complaint', super_category: 'history'},
  	{title: 'Precipitating Factors', sub_category: 'chief_complaint', category: 'chief_complaint', super_category: 'history'},
  	{title: 'Relieving Factors', sub_category: 'chief_complaint', category: 'chief_complaint', super_category: 'history'},
  	{title: 'Associated Features', sub_category: 'chief_complaint', category: 'chief_complaint', super_category: 'history'},
  	{title: 'Previous Episodes', sub_category: 'chief_complaint', category: 'chief_complaint', super_category: 'history'}
  	])
	puts "completed with populating questions for chief complaint"
end

def populate_past_medical_and_surgical_history_questions
  past_medical_and_surgical_questions = Question.create_or_update([
    {title: 'Diabetes', sub_category: 'pms_history', category: 'pms_history', super_category: 'history'},
    {title: 'Hypertension', sub_category: 'pms_history', category: 'pms_history', super_category: 'history'},
    {title: 'Hyperlipidemia', sub_category: 'pms_history', category: 'pms_history', super_category: 'history'},
    {title: 'Tuberculosis', sub_category: 'pms_history', category: 'pms_history', super_category: 'history'},
    {title: 'Stroke', sub_category: 'pms_history', category: 'pms_history', super_category: 'history'},
    {title: 'Asthma', sub_category: 'pms_history', category: 'pms_history', super_category: 'history'},
    {title: 'Any Surgery', sub_category: 'pms_history', category: 'pms_history', super_category: 'history'},
    ])

  # past_medical_and_surgical_descriptive_questions = DescriptiveQuestion.create_or_update([  
  #   ])  
end

def populate_pms_extended_history_questions
  past_medical_and_surgical_questions = Question.create_or_update([
    {title: 'Heart Failure', sub_category: 'heart_and_blood_vessels', category: 'pms_extended', super_category: 'history'},
    {title: 'High Blood Pressure', sub_category: 'heart_and_blood_vessels', category: 'pms_extended', super_category: 'history'},
    {title: 'Heart Attack', sub_category: 'heart_and_blood_vessels', category: 'pms_extended', super_category: 'history'},
    {title: 'Poor Circulation', sub_category: 'heart_and_blood_vessels', category: 'pms_extended', super_category: 'history'},
    {title: 'Stroke', sub_category: 'heart_and_blood_vessels', category: 'pms_extended', super_category: 'history'},
    {title: 'High Cholesterol/lipids', sub_category: 'heart_and_blood_vessels', category: 'pms_extended', super_category: 'history'},
    {title: 'Irregular Heart Beat', sub_category: 'heart_and_blood_vessels', category: 'pms_extended', super_category: 'history'},

    {title: 'Stones', sub_category: 'Kidney/Bladder', category: 'pms_extended', super_category: 'history'},
    {title: 'Kidney Failure / History of Dialysis', sub_category: 'Kidney/Bladder', category: 'pms_extended', super_category: 'history'},
    {title: 'Urinary Tract Infection', sub_category: 'Kidney/Bladder', category: 'pms_extended', super_category: 'history'},

    {title: 'anemia', sub_category: 'blood_disorders', category: 'pms_extended', super_category: 'history'},
    {title: 'sickle_cell_anemia', sub_category: 'blood_disorders', category: 'pms_extended', super_category: 'history'},
    {title: 'Bleeding Disorder', sub_category: 'blood_disorders', category: 'pms_extended', super_category: 'history'},

    ])

  # past_medical_and_surgical_descriptive_questions = DescriptiveQuestion.create_or_update([  
  #   ])
end


def populate_family_medical_history_questions
  family_medical_history_questions = Question.create_or_update([
    {title: 'Diabetes', sub_category: 'fm_history', category: 'fm_history', super_category: 'history'},
    {title: 'Hypertension', sub_category: 'fm_history', category: 'fm_history', super_category: 'history'},
    {title: 'Hyperlipidemia', sub_category: 'fm_history', category: 'fm_history', super_category: 'history'},
    {title: 'Tuberculosis', sub_category: 'fm_history', category: 'fm_history', super_category: 'history'},
    {title: 'Stroke', sub_category: 'fm_history', category: 'fm_history', super_category: 'history'},
    {title: 'Asthma', sub_category: 'fm_history', category: 'fm_history', super_category: 'history'},
    {title: 'Any Surgery', sub_category: 'fm_history', category: 'fm_history', super_category: 'history'},
    ])
end

def populate_fm_extended_history_questions
  past_family_medical_questions = Question.create_or_update([
    {title: 'Cancer Breast', sub_category: 'cancer', category: 'fm_extended', super_category: 'history'},
    {title: 'Cancer Ovarian', sub_category: 'cancer', category: 'fm_extended', super_category: 'history'},
    {title: 'Cancer Colon', sub_category: 'cancer', category: 'fm_extended', super_category: 'history'},
    {title: 'Poor Circulation', sub_category: 'heart_and_blood_vessels', category: 'fm_extended', super_category: 'history'},
    {title: 'Stroke', sub_category: 'heart_and_blood_vessels', category: 'fm_extended', super_category: 'history'},
    {title: 'High Cholesterol/lipids', sub_category: 'heart_and_blood_vessels', category: 'fm_extended', super_category: 'history'},
    {title: 'Irregular Heart Beat', sub_category: 'heart_and_blood_vessels', category: 'fm_extended', super_category: 'history'},

    {title: 'Stones', sub_category: 'Kidney/Bladder', category: 'fm_extended', super_category: 'history'},
    {title: 'Kidney Failure / History of Dialysis', sub_category: 'Kidney/Bladder', category: 'fm_extended', super_category: 'history'},
    {title: 'Urinary Tract Infection', sub_category: 'Kidney/Bladder', category: 'fm_extended', super_category: 'history'},

    {title: 'anemia', sub_category: 'blood_disorders', category: 'fm_extended', super_category: 'history'},
    {title: 'sickle_cell_anemia', sub_category: 'blood_disorders', category: 'fm_extended', super_category: 'history'},
    {title: 'Bleeding Disorder', sub_category: 'blood_disorders', category: 'fm_extended', super_category: 'history'},
    ])

  # past_medical_and_surgical_descriptive_questions = DescriptiveQuestion.create_or_update([  
  #   ])
end


def populate_other_system_questions
  past_family_medical_questions = Question.create_or_update([
    {title: 'pain', sub_category: 'eyes', category: 'fm_extended', super_category: 'history'},
    {title: 'Redness', sub_category: 'eyes', category: 'fm_extended', super_category: 'history'},
    {title: 'Loss of vision', sub_category: 'eyes', category: 'fm_extended', super_category: 'history'},
    {title: 'Double or Blurred Vision', sub_category: 'heart_and_blood_vessels', category: 'fm_extended', super_category: 'history'},
    {title: 'Stroke', sub_category: 'heart_and_blood_vessels', category: 'fm_extended', super_category: 'history'},
    {title: 'High Cholesterol/lipids', sub_category: 'heart_and_blood_vessels', category: 'fm_extended', super_category: 'history'},
    {title: 'Irregular Heart Beat', sub_category: 'heart_and_blood_vessels', category: 'fm_extended', super_category: 'history'},
    ])

  # past_medical_and_surgical_descriptive_questions = DescriptiveQuestion.create_or_update([  
  #   ])
end

def populate_visit_questions
  descriptive_visit_questions = DescriptiveQuestion.create_or_update([
    {title: 'Chief Complaint', sub_category: 'chief_complaint', category: 'history', super_category: 'visit'},
    {title: 'pms_history', sub_category: 'pms_history', category: 'history', super_category: 'visit'},
    {title: 'fm_history', sub_category: 'fm_history', category: 'history', super_category: 'visit'},
    {title: 'pms_extended', sub_category: 'pms_extended', category: 'history', super_category: 'visit'},
    {title: 'fm_extended', sub_category: 'fm_extended', category: 'history', super_category: 'visit'},

    ])
end

def populate_gpe_questions
  descriptive_gpe_questions = DescriptiveQuestion.create_or_update([
    {title: 'Pallor', sub_category: 'pallor', category: 'gpe', super_category: 'examination'},
    {title: 'Icterus', sub_category: 'Icterus', category: 'gpe', super_category: 'examination'},
    {title: 'Cyanosis', sub_category: 'Cyanosis', category: 'gpe', super_category: 'examination'},
    {title: 'Clubbing', sub_category: 'Clubbing', category: 'gpe', super_category: 'examination'},
    {title: 'Edema', sub_category: 'Edema', category: 'gpe', super_category: 'examination'},
    {title: 'Lymphadenopathy', sub_category: 'Lymphadenopathy', category: 'gpe', super_category: 'examination'},
    {title: 'other_findings', sub_category: 'Other Findings', category: 'gpe', super_category: 'examination'},
    ])
end

def populate_vitals_questions
  descriptive_vital_questions = DescriptiveQuestion.create_or_update([
    {title: 'Temperature', sub_category: 'Temperature', category: 'vitals', super_category: 'examination'},
    {title: 'Blood Pressure', sub_category: 'Blood Pressure', category: 'vitals', super_category: 'examination'},
    {title: 'Pulse', sub_category: 'Pulse', category: 'vitals', super_category: 'examination'},
    {title: 'Respiratory Rate', sub_category: 'Respiratory Rate', category: 'vitals', super_category: 'examination'},
    {title: 'Height', sub_category: '', category: 'vitals', super_category: 'examination'},
    {title: 'Weight', sub_category: '', category: 'vitals', super_category: 'examination'},
    {title: 'other_findings', sub_category: '', category: 'vitals', super_category: 'examination'},
    ])
end

def populate_questions
	populate_chief_complaint_questions()
  populate_past_medical_and_surgical_history_questions()
  populate_pms_extended_history_questions()
  populate_family_medical_history_questions()
  populate_fm_extended_history_questions()
  populate_visit_questions()
  populate_gpe_questions()
  populate_vitals_questions()

end


def populate_answers
	static_answers = Answer.create_or_update([
		{title: 'Yes'},
		{title: 'No'}
		])
end


def hemogram_investigation
  puts "Populating Hemogram Investigation"
  investigation_fields = Investigation.create_or_update([
    {title: 'WBC', units: 'x10E3/uL', normal_min: '4.0', normal_max: '10.5', sub_category: '', category: 'hemogram'},
    {title: 'RBC', units: 'x10E3/uL', normal_min: '4.14', normal_max: '5.80', sub_category: '', category: 'hemogram'},
    {title: 'Hemoglobin', units: 'x10E3/uL', normal_min: '12.6', normal_max: '17.7', sub_category: '', category: 'hemogram'}
    ])  
end

def lft_investigation
  puts "Populating LFT Investigation"
  investigation_fields = Investigation.create_or_update([
    {title: 'Albumin', units: 'x10E3/uL', normal_min: '4.0', normal_max: '10.5', sub_category: '', category: 'lft'},
    {title: 'GGT', units: 'x10E3/uL', normal_min: '4.14', normal_max: '5.80', sub_category: '', category: 'lft'},
    {title: 'Total Bilirubin', units: 'x10E3/uL', normal_min: '12.6', normal_max: '17.7', sub_category: '', category: 'lft'}
    ])  
end


def populate_investigations
  hemogram_investigation()
  lft_investigation()
end



def update_from_google_spreadsheet
  username = APP_CONFIG['gs_username']
  password = APP_CONFIG['gs_password']
  session = GoogleDrive.login(username, password)
  spreadsheet_key = APP_CONFIG['gs_spreadsheet_key']
  all_worksheets = session.spreadsheet_by_key(spreadsheet_key)

  #TODO put this under transaction
  ActiveRecord::Base.transaction do
    all_worksheets.worksheets.each do |ws|
      table_name = ws.title
      puts "TAble name is #{table_name}"
      table_columns = {}
      params = {}
      for row in 1..ws.num_rows
        params = {}
        for col in 1..ws.num_cols
          puts "row:#{row},col:#{col} - #{ws[row, col]}"       
          if row == 1 
            table_columns[col] = ws[row,col].to_sym
          else
            params[table_columns[col]] = ws[row,col]
          end
        end   # end of col loop 

        if row > 1
          puts "Params are - #{params}"
          puts "table columns hash is #{table_columns}"
          primary_id = params[:id].to_i
          if primary_id > 0
            model_object = Object::const_get(table_name).find_by_id primary_id
            if model_object
              model_object.update_attributes(params)
            else
              Object::const_get(table_name).create(params)
            end
          else
            puts "ERROR - id column has non integer value: #{primary_id}"
            #raise exception
          end
        end

      end # end of row loop
    end
  end

end



def create_test_users
  puts "Creating test users ++++++++++++++++++++++++++++"
  if (test_user = User.find_by_email("akhilsikri@gmail.com")).nil?
    test_user = User.create!(
      :name => "Akhil Sikri",
      :email => "akhilsikri@gmail.com",
      :password => 'password123',
      :role => 'doctor'
    )
    test_user.save!
  end
  puts "Created test user for akhilsikri@gmail.com"

  if (test_user = User.find_by_email("genauth.pvt.ltd@gmail.com")).nil?
    test_user = User.create!(
      :name => "GenAuth Pvt. Ltd.",
      :email => "genauth.pvt.ltd@gmail.com",
      :password => 'password123',
      :role => 'doctor'
    )
    test_user.save!
  end
  puts "Created test user for genauth.pvt.ltd@gmail.com"

  if (test_user = User.find_by_email("beartran3@gmail.com")).nil?
    test_user = User.create!(
      :name => "Sho Nakagome",
      :email => "beartran3@gmail.com",
      :password => 'password123',
      :role => 'doctor'
    )
    test_user.save!
  end
  puts "Created test user for beartran3@gmail.com"

end

create_test_users()
update_from_google_spreadsheet()

# populate_questions()
# populate_answers()
# populate_investigations()

