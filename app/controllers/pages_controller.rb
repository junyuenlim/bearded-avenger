class PagesController < ApplicationController
  def index
    @projects = Project.where(:published => true)
    @discussions = Discussion.where(:published => true)
  end

  def about
  end

  def welcome
  end
end
