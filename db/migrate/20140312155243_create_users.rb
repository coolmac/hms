class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :logo
	  t.string  :role
	  t.integer :age
	  t.string  :gender
	  t.date    :date_of_birth
	  t.string  :address_line1 
	  t.string  :address_line2
	  t.string  :address_line3
	  t.string  :city
	  t.string  :district
	  t.string  :state
	  t.integer :pin_code
	  t.string  :country
	  t.string  :phone_number
	  t.string  :mobile
	  t.string  :graduation
	  t.string  :post_graduation
	  t.text  :about_me

      t.timestamps
    end
  end
end
