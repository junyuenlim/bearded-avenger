class UsersController < ApplicationController

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def generate_new_password_email
      user = User.find(params[:user_id])
      user.send_reset_password_instructions
      flash[:notice] = "Reset password instructions have been sent to #{user.email}."
      redirect_to admin_user_path(user)
   end

  def show
    @user = User.find(params[:id])
    impressionist(@user)
    @projects = @user.projects
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @neighbourhood = current_user.neighbourhoods.find(params[:id])

    respond_to do |format|
      if @neighbourhood.update_attributes(params[:neighbourhood])
        format.html { redirect_to @neighbourhood, notice: 'neighbourhood was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @neighbourhood.errors, status: :unprocessable_entity }
      end
    end
  end
end