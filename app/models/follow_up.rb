# == Schema Information
#
# Table name: follow_ups
#
#  id              :integer          not null, primary key
#  follow_up_date  :datetime
#  final_diagnosis :text
#  comments        :text
#  visit_id        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class FollowUp < ActiveRecord::Base
  attr_accessible :comments, :final_diagnosis, :follow_up_date, :visit_id
  belongs_to :visit


end
