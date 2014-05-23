class FavouritePrescription < ActiveRecord::Base
  belongs_to :user
  attr_accessible :medicine_name, :frequency, :duration, :route
end
