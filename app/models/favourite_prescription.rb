class FavouritePrescription < ActiveRecord::Base
  belongs_to :user
  has_many :prescription_medicines, :dependent => :destroy
  attr_accessible :name
end
