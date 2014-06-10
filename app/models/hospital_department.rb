# == Schema Information
#
# Table name: hospital_departments
#
#  id            :integer          not null, primary key
#  hospital_id   :integer
#  department_id :integer
#

class HospitalDepartment < ActiveRecord::Base
  attr_accessible :department_id, :hospital_id
  validates :department_id, :presence => true
  validates :hospital_id, :presence => true


  belongs_to :hospital
  has_many :hospital_department_users
  has_many :users, :through => :hospital_department_users
  # has_many :patients, :through => patients of :hospital_department_users

end
