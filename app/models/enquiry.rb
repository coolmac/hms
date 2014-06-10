# == Schema Information
#
# Table name: enquiries
#
#  id           :integer          not null, primary key
#  contact_type :string(255)
#  person_name  :string(255)
#  phone_number :string(255)
#  heading      :string(255)
#  sub_heading  :string(255)
#  message      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Enquiry < ActiveRecord::Base
  attr_accessible :contact_type, :heading, :message, :person_name, :phone_number, :sub_heading
end
