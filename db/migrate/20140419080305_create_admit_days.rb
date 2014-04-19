class CreateAdmitDays < ActiveRecord::Migration
  def change
    create_table :admit_days do |t|
      t.references :admission
      t.datetime :admit_date
      t.text :doctor_notes
      t.text :nurse_notes
      t.text :care_giver_notes
      t.text :treatment
      t.integer :serial_number

      t.timestamps
    end
    add_index :admit_days, :admission_id
  end
end
