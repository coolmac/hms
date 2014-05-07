class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.string :contact_type
      t.string :person_name
      t.string :phone_number
      t.string :heading
      t.string :sub_heading
      t.text :message

      t.timestamps
    end
  end
end
