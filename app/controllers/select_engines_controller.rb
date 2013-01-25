class SelectEnginesController < ApplicationController


	def select_engine
		form_params = params.to_param
		if params[:wine][:api_type] == "tasting_flight"
			redirect_to "/refinery/api_tasting_flights/new?#{form_params}"
		else 
			redirect_to "/refinery/api_wines/new?#{form_params}"
		end
	
	end

end