class CreateHospitalDepartments < ActiveRecord::Migration
  def change
    create_table :hospital_departments do |t|
      t.integer :hospital_id
      t.integer :department_id
    end

    #TODO need to add indexes based on usage
  end
end
