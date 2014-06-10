# == Schema Information
#
# Table name: quotes
#
#  id         :integer          not null, primary key
#  date       :date
#  quote      :string(255)
#  author     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Quote < ActiveRecord::Base
  attr_accessible :author, :date, :quote

  def self.random
  	Quote.find_by_id rand(Quote.count) + 1
  end
  
end
