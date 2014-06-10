# == Schema Information
#
# Table name: visit_descriptions
#
#  id             :integer          not null, primary key
#  visit_id       :integer
#  description_id :integer
#

class VisitDescription < ActiveRecord::Base
  attr_accessible :description_id, :visit_id
end
