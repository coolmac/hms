# == Schema Information
#
# Table name: user_patients
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  patient_id :integer
#

class UserPatient < ActiveRecord::Base
  attr_accessible :patient_id, :user_id

  belongs_to :user
  belongs_to :patient
  
end
