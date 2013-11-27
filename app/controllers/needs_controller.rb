class NeedsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @need = @project.needs.build(params[:need])
    @need.save

    respond_to do |format|
      if @need.save
        format.html { redirect_to @project, notice: 'Updated need.' }
        format.json { render json: @need, need: :created, location: @need }
      else
        format.html { render action: "new" }
        format.json { render json: @need.errors, need: :unprocessable_entity }
      end
    end
  end
end
