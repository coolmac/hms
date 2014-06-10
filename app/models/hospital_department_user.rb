# == Schema Information
#
# Table name: hospital_department_users
#
#  id                     :integer          not null, primary key
#  hospital_department_id :integer
#  user_id                :integer
#

class HospitalDepartmentUser < ActiveRecord::Base
  attr_accessible :hospital_department_id, :user_id

  validates :hospital_department_id, :presence => true
  validates :user_id, :presence => true

  belongs_to :hospital_department
  belongs_to :user

end
