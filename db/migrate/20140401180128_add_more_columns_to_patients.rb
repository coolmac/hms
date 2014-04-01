class AddMoreColumnsToPatients < ActiveRecord::Migration
  def change
  	rename_column :patients, :date_of_visit, :date_of_registration
  	rename_column :patients, :name, :first_name
  	add_column :patients, :middle_name, :string
  	add_column :patients, :last_name, :string
  	add_column :patients, :date_of_birth, :datetime
  	add_column :patients, :reference_mobile, :string
  	add_column :patients, :reference_name, :string
  	add_column :patients, :emergency_mobile, :string
  	add_column :patients, :emergency_name, :string
  	add_column :patients, :nationality, :string
  	add_column :patients, :occupation, :string
  	add_column :patients, :patient_type, :string
  	add_column :patients, :id_type, :string
  	add_column :patients, :id_number, :string
  	add_column :patients, :referred_by, :string
  	add_column :patients, :insurance_provider, :string
  	add_column :patients, :insurance_policy_number, :string
  	add_column :patients, :address_id, :integer
  end
end
