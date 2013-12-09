class PagesController < ApplicationController
  def index
  	@activities = PublicActivity::Activity.order("created_at desc")
    @projects = Project.where(:published => true)
    @discussions = Discussion.order("updated_at desc").where(:published => true).limit(5)
    @comments = Comment.all
    @neighbourhoods = Neighbourhood.order("name")

    @neighbourhood = Neighbourhood.new(params[:neighbourhood])
  end

  def about
  end

  def welcome
  end
end
