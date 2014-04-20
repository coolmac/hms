class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.references :visit
      t.string :medicine
      t.string :frequency
      t.string :duration
      t.string :route

      t.timestamps
    end
    add_index :prescriptions, :visit_id
  end
end
