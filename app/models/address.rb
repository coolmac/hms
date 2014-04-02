class Address < ActiveRecord::Base
  attr_accessible :address_line1, :address_line2, :address_line3, :city, :district, :state, :pin_code, :country

  belongs_to :patient
end