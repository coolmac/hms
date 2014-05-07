class Enquiry < ActiveRecord::Base
  attr_accessible :contact_type, :heading, :message, :person_name, :phone_number, :sub_heading
end
