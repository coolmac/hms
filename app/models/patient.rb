class Patient < ActiveRecord::Base
  attr_accessible :mobile, :name

  fuzzily_searchable :name
end
