# == Schema Information
#
# Table name: addresses
#
#  id            :integer          not null, primary key
#  address_line1 :string(255)
#  address_line2 :string(255)
#  address_line3 :string(255)
#  city          :string(255)
#  district      :string(255)
#  state         :string(255)
#  pin_code      :integer
#  country       :string(255)
#  patient_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Address < ActiveRecord::Base
  attr_accessible :address_line1, :address_line2, :address_line3, :city, :district, :state, :pin_code, :country

  belongs_to :patient
end
