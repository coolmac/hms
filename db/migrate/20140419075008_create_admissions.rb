class CreateAdmissions < ActiveRecord::Migration
  def change
    create_table :admissions do |t|
      t.references :visit
      t.datetime :admission_date
      t.string :bed
      t.string :doctor
      t.boolean :is_mlc
      t.text :mlc_details
      t.text :description

      t.timestamps
    end
    add_index :admissions, :visit_id
  end
end
