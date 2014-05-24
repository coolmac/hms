class CreatePrescriptionMedicines < ActiveRecord::Migration
  def change
    create_table :prescription_medicines do |t|
      t.references :favourite_prescription
      t.string :medicine
      t.string :frequency
      t.string :duration
      t.string :route

      t.timestamps
    end
    add_index :prescription_medicines, :favourite_prescription_id
  end
end
