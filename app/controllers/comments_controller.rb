class CommentsController < ApplicationController
  def create
    @discussion = Discussion.find(params[:discussion_id])
    @comment = @discussion.comments.build(params[:comment])
    @comment.user_id = current_user.id
    @comment.save

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @discussion, notice: 'Comment added.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
end
