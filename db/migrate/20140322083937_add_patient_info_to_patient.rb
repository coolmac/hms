class AddPatientInfoToPatient < ActiveRecord::Migration
  def change
  	add_column :patients, :husband_name, :string
  	add_column :patients, :father_name, :string
  	add_column :patients, :age, :integer
	add_column :patients, :gender, :string
  	add_column :patients, :aadhaar_card_number, :string
  	add_column :patients, :date_of_visit, :datetime
  end
end
