ActiveAdmin.register Project do

  index do
    column :id
    column :title
    column :description
    column :city_list
    column :tag_list
    column :user
    column :published
    default_actions
  end

  form do |f|
    f.inputs "User Details" do
        f.input :id
        f.input :title
        f.input :description
        f.input :city_list
        f.input :tag_list
        f.input :user
        f.input :published
    end
    f.buttons
  end

end
