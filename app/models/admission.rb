# == Schema Information
#
# Table name: admissions
#
#  id             :integer          not null, primary key
#  visit_id       :integer
#  admission_date :datetime
#  bed            :string(255)
#  doctor         :string(255)
#  is_mlc         :boolean
#  mlc_details    :text
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Admission < ActiveRecord::Base

  #TODO implement relations without directly accessing visit_id, HINT: check nested resources syntax
  attr_accessible :admission_date, :bed, :description, :doctor, :is_mlc, :mlc_details, :visit_id

  belongs_to :visit
  has_many :admit_days

end
