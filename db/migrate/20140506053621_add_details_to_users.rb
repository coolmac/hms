class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :address_line1, :string
    add_column :users, :address_line2, :string
    add_column :users, :address_line3, :string
    add_column :users, :city, :string
    add_column :users, :district, :string
    add_column :users, :state, :string
    add_column :users, :pin_code, :integer
    add_column :users, :country, :string
    add_column :users, :phone_number, :string
    add_column :users, :mobile, :string
    add_column :users, :graduation, :string
    add_column :users, :post_graduation, :string
    add_column :users, :about_me, :text
  end
end
