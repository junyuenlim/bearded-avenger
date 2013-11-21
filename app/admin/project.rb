ActiveAdmin.register Project do

  index do
    column :id
    column :title
    column :description
    column :city_list
    column :tag_list
    column :user
    column :published
    column "Views", :impressionist_count
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
        f.input :impressionist_count
    end
    f.buttons
  end

end
