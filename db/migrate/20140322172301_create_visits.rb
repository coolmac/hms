class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :patient_id
      t.integer :history_id
      t.integer :examination_id
      t.integer :investigation_id
      t.integer :admission_id
      t.integer :treatment_id
      t.integer :follow_up_id

      t.timestamps
    end
  end
end
