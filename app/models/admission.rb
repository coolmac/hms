class Admission < ActiveRecord::Base

  #TODO implement relations without directly accessing visit_id, HINT: check nested resources syntax
  attr_accessible :admission_date, :bed, :description, :doctor, :is_mlc, :mlc_details, :visit_id

  belongs_to :visit
  has_many :admit_days

end
