class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :patient_id
      t.text :description
      t.date :visit_time
      t.string :name
      
      t.timestamps
    end

    add_index :visits, :patient_id

  end
end
