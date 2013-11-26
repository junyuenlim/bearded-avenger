class StatusesController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @status = @project.statuses.build(params[:status])
    @status.save

    respond_to do |format|
      if @status.save
        format.html { redirect_to @project, notice: 'Updated status.' }
        format.json { render json: @status, status: :created, location: @status }
      else
        format.html { render action: "new" }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end
end
