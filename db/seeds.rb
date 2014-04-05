# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def populate_chief_complaint_questions
  chief_complaint_questions = DescriptiveQuestion.create_or_update([
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




def populate_questions
	populate_chief_complaint_questions()

end

def populate_answers
	static_answers = Answer.create_or_update([
		{title: 'Yes'},
		{title: 'No'}
		])
end

def create_test_users
  if (test_user = User.find_by_email("akhilsikri@gmail.com")).nil?
    test_user = User.create!(
      :name => "Akhil Sikri",
      :email => "akhilsikri@gmail.com",
      :password => 'password123',
      :role => 'doctor'
    )
    test_user.confirmed_at = Time.now
    test_user.save!
  end

  if (test_user = User.find_by_email("beartran3@gmail.com")).nil?
    test_user = User.create!(
      :name => "Sho Nakagome",
      :email => "beartran3@gmail.com",
      :password => 'password123',
      :role => 'doctor'
    )
    test_user.confirmed_at = Time.now
    test_user.save!
  end

end


create_test_users()
populate_questions()
populate_answers()

