class Admission < ActiveRecord::Base
  has_many :admit_days
  attr_accessible :admission_date, :bed, :description, :doctor, :is_mlc, :mlc_details

  belongs_to :visit
end
