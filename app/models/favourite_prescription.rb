# == Schema Information
#
# Table name: favourite_prescriptions
#
#  id                           :integer          not null, primary key
#  user_id                      :integer
#  CreateFavouritePrescriptions :string(255)
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class FavouritePrescription < ActiveRecord::Base
  belongs_to :user
  has_many :prescription_medicines, :dependent => :destroy
  attr_accessible :name
end
