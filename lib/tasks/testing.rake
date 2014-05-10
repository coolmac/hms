
##TODO Analyse row query option


def create_patients (total_patients)
    begin
      if Patient.find_by_first_name('TestPatient-'+total_patients.to_s).nil?
        test_patient=Patient.new
        test_patient.first_name='TestPatient-'+total_patients.to_s
        test_patient.age = 25+total_patients
        test_patient.mobile = '98546000'+total_patients.to_s
        test_patient.registration_time = '2014-05-05'
        test_patient.save
        puts "Created a test patient with first name - #{test_patient.first_name}"

      else
        puts "Patient already exists"
      end
      total_patients -=1
    end while total_patients >0  
end

def create_visits_for_existing_patients(total_patients, total_visits, start_date, end_date)
  patients = Patient.find(:all, :order => "id desc", :limit => total_patients)
  total_dates = (end_date - start_date).to_i + 1
  puts "==================>>>>>>>>>total dates"
  puts total_dates
  visit_per_patient = total_visits/total_patients
  extra_visit = total_visits%total_patients
  puts "==================>>>>>>>>>visit_per_patient"
  puts visit_per_patient
  puts extra_visit
  visits_per_date = total_visits/total_dates
  puts "==================>>>>>>>>>visit_per_date"
  puts visits_per_date

  # Loop for visit_per_patient
  begin
    puts "==========XXXXXXXXX=========="
    patients_count = total_patients
    # Creating visit for each patient
    begin 
      if Visit.find_by_patient_id_and_visit_time(patients[(patients_count-1)].id,start_date).nil?
        visit = Visit.new
        visit.patient_id = patients[(patients_count-1)].id
        visit.visit_time = start_date
        visit.save
        puts "Created a test visit for patient_id - #{visit.patient_id}"
        
      end
      visits_per_date -=1
      if visits_per_date < 0
          start_date = (start_date + 1.days)
          visits_per_date = total_visits/total_dates
      end
      patients_count -=1
    end while patients_count > 0
    visit_per_patient -=1
  end while visit_per_patient > 0

  if extra_visit > 0
    begin
      visit = Visit.new
        puts "===========Extra======="
        puts extra_visit-1
        #puts patient_id[(extra_visit-1)].id
        visit.patient_id = patient_id[(extra_visit-1)].id
        visit.visit_time = end_date
          puts visit.patient_id.to_s+"/"+visit.visit_time.to_s
        visit.save
        puts "Created a test visit for patient_id - #{visit.patient_id}"
        extra_visit -=1
    end while extra_visit > 0
  end
end

def create_total_visits(start_date_for_p24h,end_date)
  if start_date_for_p24h.length==0
    total_visits = Visit.select("count(id),date(visit_time)").where("visit_time BETWEEN ? AND ?",'2014-05-05', end_date).group("date(visit_time)").order("visit_time")
  else
    total_visits = Visit.select("count(id),date(visit_time)").where("visit_time BETWEEN ? AND ?",start_date_for_p24h[0].date, end_date).group("date(visit_time)").order("visit_time")
  end
  puts "========total visits/date====="
  puts total_visits.length
  i =  0
  while i < total_visits.length 
    if Chart.find_by_xvalue_and_tag(total_visits[i].date,'p24h').nil?
      puts total_visits[i].date.to_s+"/"+total_visits[i].count.to_s
      chart_value = Chart.new
      chart_value.tag = 'p24h'
      chart_value.name = 'Patients Every Day'
      chart_value.xvalue = total_visits[i].date
      chart_value.yvalue = total_visits[i].count
      chart_value.save
    end
    i +=1
  end
end

def create_unique_visits(start_date_for_v24h,end_date)
  if start_date_for_v24h.length==0
    unique_visits = Patient.select("count(id),date(registration_time)").where("registration_time BETWEEN ? AND ?",'2014-05-05', end_date).group("date(registration_time)").order("registration_time")
  else
    unique_visits = Patient.select("count(id),date(registration_time)").where("registration_time BETWEEN ? AND ?",start_date_for_v24h[0].date, end_date).group("date(registration_time)").order("registration_time")
  end  
  j =  0
  puts "========unique visits/date====="
  while j < unique_visits.length
    if Chart.find_by_xvalue_and_tag(unique_visits[j].date,'v24h').nil? 
      puts unique_visits[j].date.to_s+"/"+unique_visits[j].count.to_s
      chart_value = Chart.new
      chart_value.tag = 'v24h'
      chart_value.name = 'Unique Visits'
      chart_value.xvalue = unique_visits[j].date
      chart_value.yvalue = unique_visits[j].count
      chart_value.save
    end
    j +=1
  end
end

namespace :testing do
  
  desc "TODO"
  task :dummy_patients => :environment do
  	number=25
    create_patients(number)
  end


  desc "TODO"
  task :dummy_visits => :environment do
  	total_patients = 25
  	total_visits = 75
    start_date = Date.parse('2014-05-05')
    end_date = Date.parse('2014-05-08')
    create_patients(total_patients)  	
    create_visits_for_existing_patients(total_patients, total_visits, start_date, end_date)

  end

  desc "TODO"
  task :dummy_chart_values => :environment do
    total_patients = 25
    total_visits = 75
    start_date = Date.parse('2014-05-05')
    end_date = Date.parse('2014-05-08')
    create_patients(total_patients)   
    create_visits_for_existing_patients(total_patients, total_visits, start_date, end_date)
    start_date_for_p24h = Chart.select("date(xvalue)").where("tag='p24h'").order("xvalue desc").limit(1)
    start_date_for_v24h = Chart.select("date(xvalue)").where("tag='v24h'").order("xvalue desc").limit(1)
    end_date = (Time.now).strftime("%Y-%m-%d")
    create_total_visits(start_date_for_p24h,end_date)
    create_unique_visits(start_date_for_v24h,end_date)
  end

end
