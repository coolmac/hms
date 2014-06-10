class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :mobile
  	  t.string  :husband_name
  	  t.string  :father_name
  	  t.integer :age
	    t.string  :gender
  	  t.string  :middle_name
  	  t.date    :date_of_birth
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
      t.string  :email
      t.string  :uhid
      t.date    :registration_time
      
      t.timestamps
    end

    add_index :patients, :first_name
    add_index :patients, :last_name
    add_index :patients, :mobile
    add_index :patients, :uhid
    add_index :patients, :email

  end
end
