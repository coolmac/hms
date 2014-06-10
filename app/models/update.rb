# == Schema Information
#
# Table name: updates
#
#  id         :integer          not null, primary key
#  heading    :string(255)
#  link       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Update < ActiveRecord::Base
  attr_accessible :content, :heading, :link
end
