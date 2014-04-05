module ActiveRecordExtension

  extend ActiveSupport::Concern

  # add your instance methods here
  # def foo
  #    "foo"
  # end


  # add your static(class) methods here
  module ClassMethods
    
    def create_or_update (params)
      params.each do |param|
  		model = where(param)
  		if model.size > 0
  		  # puts "Entry #{param} - already exists"
  		  model[0].update_attributes(param)
  		else
  		  create(param)
  		end
  	  end
    end

  end

end

# include the extension 
ActiveRecord::Base.send(:include, ActiveRecordExtension)