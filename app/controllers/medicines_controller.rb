class MedicinesController < ApplicationController
	#http://graffzon.tumblr.com/post/31730804641/lightweight-handmade-solution-for-jquery-autocomplete
	def autocomplete_medicine_name
		names = Medicine.select([:name]).where("UPPER(name) LIKE ?", ("#{params[:name]}%").upcase)
    	result = names.collect do |t|
      		{ value: t.name }
    	end
    
    	render json: result
    end
end
