class NeighbourhoodsController < ApplicationController
	def index
	  @neighbourhoods = Neighbourhood.order("name")
	  @neighbourhood = Neighbourhood.new(params[:neighbourhood])

	  @municipals = Municipal.all
	end

	def create
		@neighbourhood = Neighbourhood.new(params[:neighbourhood])

		respond_to do |format|
		  if @neighbourhood.save
		    format.html { redirect_to root_path, notice: 'Neighbourhood added! Thanks!' }
		    format.json { render json: @neighbourhood, neighbourhood: :created, location: @neighbourhood }
		  else
		    format.html { render action: "new" }
		    format.json { render json: @neighbourhood.errors, neighbourhood: :unprocessable_entity }
		  end
		end
	end

	def show
		@neighbourhood = Neighbourhood.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @neighbourhood }
		end
	end

	def update
		@neighbourhood = Neighbourhood.find(params[:id])

		respond_to do |format|
			if @neighbourhood.update_attributes(params[:neighbourhood])
			format.html { redirect_to @neighbourhood, notice: 'Updated neighbourhood information.' }
			format.json { head :no_content }
			else
			format.html { render action: "edit" }
			format.json { render json: @neighbourhood.errors, status: :unprocessable_entity }
			end
		end
	end
end
