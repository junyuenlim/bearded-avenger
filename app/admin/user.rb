ActiveAdmin.register User do

  index do
    column :id
    column "Profile pic" do |event|
      link_to(image_tag(event.avatar.url, :height => '50'))
    end
    column :email
    column :name
    column :first_name
    column :last_name
    column :gender
    column :provider
    column :fb_verified
    column :location
    column :fb_link
    column :uid
    default_actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :first_name
      f.input :last_name
      f.input :gender
      f.input :fb_verified
      f.input :location
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :superadmin, :label => "Super Administrator"
    end
    f.buttons
  end

  create_or_edit = Proc.new {
    @user            = User.find_or_create_by_id(params[:id])
    @user.superadmin = params[:user][:superadmin]
    @user.attributes = params[:user].delete_if do |k, v| 
      (k == "superadmin") ||
      (["password", "password_confirmation"].include?(k) && v.empty? && !@user.new_record?)
    end
    if @user.save
      redirect_to :action => :show, :id => @user.id
    else
      render active_admin_template((@user.new_record? ? 'new' : 'edit') + '.html.erb')
    end
  }
  member_action :create, :method => :post, &create_or_edit
  member_action :update, :method => :put, &create_or_edit

end