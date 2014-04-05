class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string  :first_name
      t.string  :last_name
      t.integer :mobile
  	  t.string  :husband_name
  	  t.string  :father_name
  	  t.integer :age
	    t.string  :gender
  	  t.datetime :date_of_registration
  	  t.string  :middle_name
  	  t.datetime :date_of_birth
  	  t.string  :reference_mobile
  	  t.string  :reference_name
  	  t.string  :emergency_mobile
  	  t.string  :emergency_name
  	  t.string  :nationality
  	  t.string  :occupation
  	  t.string  :patient_type
  	  t.string  :id_type
  	  t.string  :id_number
  	  t.string  :referred_by
  	  t.string  :insurance_provider
  	  t.string  :insurance_policy_number
      t.string  :religion

      t.timestamps
    end
  end
end
