class InspirationsController < ApplicationController

  def show
    @inspiration = Inspiration.find(params[:id])
    impressionist(@inspiration)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inspiration }
    end
  end

  def new
    @discussion = Discussion.find(params[:discussion_id])
    @inspiration = @discussion.inspirations.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inspiration }
    end
  end

  # GET /inspirations/1/edit
  def edit
    @inspiration = current_user.inspirations.find(params[:id])
  end

  # POST /inspirations
  # POST /inspirations.json
  def create
  	@discussion = Discussion.find(params[:discussion_id])
  	@inspiration = @discussion.inspirations.build(params[:inspiration])
  	@inspiration.user_id = current_user.id
  	@inspiration.save

    respond_to do |format|
      if @inspiration.save
        format.html { redirect_to @discussion, notice: 'Inspiration was successfully created.' }
        format.json { render json: @inspiration, status: :created, location: @inspiration }
      else
        format.html { render action: "new" }
        format.json { render json: @inspiration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /inspirations/1
  # PUT /inspirations/1.json
  def update
    @inspiration = current_user.inspirations.find(params[:id])

    respond_to do |format|
      if @inspiration.update_attributes(params[:inspiration])
        format.html { redirect_to @inspiration, notice: 'inspiration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inspiration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inspirations/1
  # DELETE /inspirations/1.json
  def destroy
    @inspiration = current_user.inspirations.find(params[:id])
    @inspiration.destroy

    respond_to do |format|
      format.html { redirect_to inspirations_url }
      format.json { head :no_content }
    end
  end

end
