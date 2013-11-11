class RelationshipsController < ApplicationController

  def create
    @project = Project.find(params[:relationship][:followedproject_id])
    current_user.follow_project!(@project)

    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
        @project = Relationship.find(params[:id]).followed_project
        current_user.unfollow_project!(@project)
        
        respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end