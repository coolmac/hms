class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :patient_id
      t.text :description
      t.text :chief_complaint
      t.text :pms_history
      t.text :fm_history
      t.text :ps_history
      t.text :treatment_history
      t.text :other_systems

      t.timestamps
    end
  end
end
