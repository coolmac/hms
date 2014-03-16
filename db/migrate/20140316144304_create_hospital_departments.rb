class CreateHospitalDepartments < ActiveRecord::Migration
  def change
    create_table :hospital_departments do |t|
      t.integer :hospital_id
      t.integer :department_id
    end
  end
end
