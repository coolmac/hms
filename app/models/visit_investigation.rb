# == Schema Information
#
# Table name: visit_investigations
#
#  id               :integer          not null, primary key
#  visit_id         :integer
#  investigation_id :integer
#  report           :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class VisitInvestigation < ActiveRecord::Base
  attr_accessible :investigation_id, :report, :visit_id
end
