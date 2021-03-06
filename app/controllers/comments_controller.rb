class CommentsController < ApplicationController
  def create
    @discussion = Discussion.find(params[:discussion_id])
    @comment = @discussion.comments.build(params[:comment])
    @comment.user_id = current_user.id
    @comment.save

    respond_to do |format|
      if @comment.save
        @comment.create_activity :create, owner: current_user, recipient: @discussion
        format.html { redirect_to @discussion, notice: 'Comment added.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def upvote
    @comment = Comment.find(params[:id])
    @comment.liked_by current_user
    redirect_to :back, notice: "Thank you for voting"
  end

  def downvote
    @comment = Comment.find(params[:id])
    @comment.unliked_by current_user
    redirect_to :back, notice: "Thank you for voting"
  end
end
