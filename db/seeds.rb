# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def populate_chief_complaint_questions
  chief_complaint_questions = Question.create([
  	{title: 'Symptom', sub_category: 'chief_complaint', category: 'chief_complaint', super_category: 'history', answer_type: 'description'},
  	{title: 'Onset', sub_category: 'chief_complaint', category: 'chief_complaint', super_category: 'history', answer_type: 'description'},
  	{title: 'Duration', sub_category: 'chief_complaint', category: 'chief_complaint', super_category: 'history', answer_type: 'description'},
  	{title: 'Course', sub_category: 'chief_complaint', category: 'chief_complaint', super_category: 'history', answer_type: 'description'},
  	{title: 'Severity', sub_category: 'chief_complaint', category: 'chief_complaint', super_category: 'history', answer_type: 'description'},
  	{title: 'Precipitating Factors', sub_category: 'chief_complaint', category: 'chief_complaint', super_category: 'history', answer_type: 'description'},
  	{title: 'Relieving Factors', sub_category: 'chief_complaint', category: 'chief_complaint', super_category: 'history', answer_type: 'description'},
  	{title: 'Associated Features', sub_category: 'chief_complaint', category: 'chief_complaint', super_category: 'history', answer_type: 'description'},
  	{title: 'Previous Episodes', sub_category: 'chief_complaint', category: 'chief_complaint', super_category: 'history', answer_type: 'description'}
  	])

	puts "completed with populating questions for chief complaint"
end




def populate_questions
	populate_chief_complaint_questions()

end


populate_questions()


