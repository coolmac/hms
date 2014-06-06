class Quote < ActiveRecord::Base
  attr_accessible :author, :date, :quote

  	def self.random
  		Quote.find_by_id rand(Quote.count) + 1
	end
end
