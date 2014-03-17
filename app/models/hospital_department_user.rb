class HospitalDepartmentUser < ActiveRecord::Base
  attr_accessible :hospital_department_id, :user_id

  validates :hospital_department_id, :presence => true
  validates :user_id, :presence => true

  belongs_to :hospital_department
  belongs_to :user

end
