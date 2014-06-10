# == Schema Information
#
# Table name: visit_descriptive_questions
#
#  id                      :integer          not null, primary key
#  visit_id                :integer
#  descriptive_question_id :integer
#  answer                  :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class VisitDescriptiveQuestion < ActiveRecord::Base
  attr_accessible :answer, :descriptive_question_id, :visit_id
end
