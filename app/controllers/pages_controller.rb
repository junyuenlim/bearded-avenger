class PagesController < ApplicationController
  def index
  	if current_user.location.blank?
  		@projects = Project.where(:published => true)
  		@discussions = Discussion.where(:published => true)
  	else
	  	@projects = Project.tagged_with(current_user.location).where(:published => true)
	  	@discussions = Discussion.tagged_with(current_user.location).where(:published => true)
	end
  end

  def about
  end

  def welcome
  end
end
