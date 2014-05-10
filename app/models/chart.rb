class Chart < ActiveRecord::Base
  attr_accessible :name, :tag, :xvalue, :yvalue
end
