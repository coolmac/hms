# == Schema Information
#
# Table name: hospitals
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  university_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Hospital < ActiveRecord::Base
  attr_accessible :name, :university_id
  validates :name, :presence => true


  has_many :hospital_departments
  has_many :departments, :through => :hospital_departments, :source => :hospital
  # has_many :users, :through => doctors of hospital_department_users of belonging hospital_departments
  # has_many :patients, :through => patients of users from :hospital_department_users

end
