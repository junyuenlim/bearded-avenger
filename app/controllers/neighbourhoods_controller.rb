class NeighbourhoodsController < ApplicationController
	def index
	  @neighbourhoods = Neighbourhood.order(:name).where("name like ?", "%#{params[:term]}%")
	  render json: @neighbourhoods.map(&:name)
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
end
