class CreateHospitalDepartmentUsers < ActiveRecord::Migration
  def change
    create_table :hospital_department_users do |t|
      t.integer :hospital_department_id
      t.integer :user_id
    end
  end
end
