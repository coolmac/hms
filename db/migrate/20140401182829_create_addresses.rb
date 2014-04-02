class CreateAddresses < ActiveRecord::Migration
  
  def change
    create_table :addresses do |t|
      t.string :address_line1
      t.string :address_line2
      t.string :address_line3
      t.string :city
      t.string :district
      t.string :state
      t.integer :pin_code
      t.string :country
      t.integer :patient_id
      
      t.timestamps
    end
  end

end
