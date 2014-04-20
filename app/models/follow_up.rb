class FollowUp < ActiveRecord::Base
  attr_accessible :comments, :final_diagnosis, :follow_up_date, :visit_id
  belongs_to :visit


end
