# == Schema Information
#
# Table name: answers
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Answer < ActiveRecord::Base
  attr_accessible :title
end
