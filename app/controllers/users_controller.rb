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
  end
end