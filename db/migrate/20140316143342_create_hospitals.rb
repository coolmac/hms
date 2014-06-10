class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.integer :university_id

      t.timestamps
    end

  end
end
