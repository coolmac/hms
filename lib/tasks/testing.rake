namespace :testing do
  desc "TODO"
  task :dummy_patients => :environment do
  	number=25
    begin
      if Patient.find_by_first_name('TestPatient-'+number.to_s).nil?
        test_patient=Patient.new
        test_patient.first_name='TestPatient-'+number.to_s
        test_patient.age = 25+number
        test_patient.mobile = '98546000'+number.to_s
        test_patient.registration_time = '2014-05-05'
        test_patient.save
        puts "Created a test patient with first name - #{test_patient.first_name}"

      else
      	puts "Patient already exists"
      end
      number -=1
    end while number >0

  end

  desc "TODO"
  task :dummy_visits => :environment do
  	patients = 25
  	visits = 75
  	patient_id = Patient.find(:all, :order => "id desc", :limit => patients)
    #puts patient_id[2].id
  	start_date = Date.parse('2014-05-05')
  	end_date = Date.parse('2014-05-08')
  	total_dates = (end_date - start_date).to_i + 1
  	   puts "==================>>>>>>>>>total dates"
  	   puts total_dates
	  visit_per_patient = visits/patients
    extra_visit = visits%patients
      puts "==================>>>>>>>>>visit_per_patient"
      puts visit_per_patient
      puts extra_visit
  	visits_per_date = visits/total_dates
      puts "==================>>>>>>>>>visit_per_date"
      puts visits_per_date
  	begin
      puts "==========XXXXXXXXX=========="
      patients =25
	  	begin 
	  		visit = Visit.new
	  		visit.patient_id = patient_id[(patients-1)].id
	  		visit.visit_time = start_date
        puts visit.patient_id.to_s+"/"+visit.visit_time.to_s
	  		visit.save
	  		puts "Created a test visit for patient_id - #{visit.patient_id}"
	  		visits_per_date -=1
	  		if visits_per_date < 0
          start_date = (start_date + 1.days)
          visits_per_date = visits/total_dates
        end
	  		patients -=1
	  	end while patients > 0
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

  desc "TODO"
  task :dummy_chart_values => :environment do
    last_chart_date_p24h = Chart.select("date(xvalue)").where("tag='p24h'").order("xvalue desc").limit(1)
    last_chart_date_v24h = Chart.select("date(xvalue)").where("tag='v24h'").order("xvalue desc").limit(1)
    end_date = (Time.now).strftime("%Y-%m-%d")
    if last_chart_date_p24h.length==0
      total_visits = Visit.select("count(id),date(visit_time)").where("visit_time BETWEEN ? AND ?",'2014-05-05', end_date).group("date(visit_time)").order("visit_time")
    else
      total_visits = Visit.select("count(id),date(visit_time)").where("visit_time BETWEEN ? AND ?",last_chart_date_p24h[0].date, end_date).group("date(visit_time)").order("visit_time")
    end
    if last_chart_date_v24h.length==0
      unique_visits = Patient.select("count(id),date(registration_time)").where("registration_time BETWEEN ? AND ?",'2014-05-05', end_date).group("date(registration_time)").order("registration_time")
    else
      unique_visits = Patient.select("count(id),date(registration_time)").where("registration_time BETWEEN ? AND ?",last_chart_date_v24h[0].date, end_date).group("date(registration_time)").order("registration_time")
    end
      puts "============ end date =========="
      #puts last_chart_date[0].date
      puts end_date
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

end
