class DiscussionsController < ApplicationController

  def index
    @discussions = Discussion.where(:published => true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discussions }
    end
  end

  def show
    @discussion = Discussion.find(params[:id])
    @inspirations = @discussion.inspirations.all

    @discussion = Discussion.find(params[:id])
    @comments = @discussion.comments.order("updated_at desc")

    impressionist(@discussion)

    @inspiration = @discussion.inspirations.build
    @comment = @discussion.comments.new

    @inspiration.destroy

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discussion }
    end
  end

  def new
    @discussion = current_user.discussions.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discussion }
    end
  end

  # GET /discussions/1/edit
  def edit
    @discussion = current_user.discussions.find(params[:id])
  end

  # POST /discussions
  # POST /discussions.json
  def create
    @discussion = current_user.discussions.new(params[:discussion])

    respond_to do |format|
      if @discussion.save
        @discussion.create_activity :create, owner: current_user
        format.html { redirect_to @discussion, notice: 'Discussion was successfully created.' }
        format.json { render json: @discussion, status: :created, location: @discussion }
      else
        format.html { render action: "new" }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /discussions/1
  # PUT /discussions/1.json
  def update
    @discussion = current_user.discussions.find(params[:id])

    respond_to do |format|
      if @discussion.update_attributes(params[:discussion])
        # @discussion.create_activity :update, owner: current_user
        format.html { redirect_to @discussion, notice: 'Discussion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    @discussion = current_user.discussions.find(params[:id])
    @discussion.destroy

    respond_to do |format|
      format.html { redirect_to discussions_url }
      format.json { head :no_content }
    end
  end

end
