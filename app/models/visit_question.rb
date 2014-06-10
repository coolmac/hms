# == Schema Information
#
# Table name: visit_questions
#
#  id          :integer          not null, primary key
#  visit_id    :integer
#  question_id :integer
#  answer_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class VisitQuestion < ActiveRecord::Base
  attr_accessible :answer_id, :question_id, :visit_id
end
