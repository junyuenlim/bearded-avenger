class MunicipalsController < ApplicationController
	def show
		@municipal = Municipal.find(params[:id])
		@neighbourhoods = @municipal.neighbourhoods.order("name")

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @municipal }
		end
	end
end
