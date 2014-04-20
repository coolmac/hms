class Prescription < ActiveRecord::Base
  belongs_to :visit
  attr_accessible :duration, :frequency, :medicine, :route
end
