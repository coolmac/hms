class CreateAddresses < ActiveRecord::Migration

    create_table :addresses do |t|
      t.string :building
      t.string :street
      t.string :nearest_milestone
      t.string :city
      t.string :district
      t.string :state
      t.integer :pin_code
      t.string :country

      t.timestamps
    end

end
