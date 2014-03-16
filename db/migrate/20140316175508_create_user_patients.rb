class CreateUserPatients < ActiveRecord::Migration
  def change
    create_table :user_patients do |t|
      t.integer :user_id
      t.integer :patient_id
    end
  end
end
