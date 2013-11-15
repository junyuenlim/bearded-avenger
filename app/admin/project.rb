ActiveAdmin.register Project do

  index do
    column :id
    column :title
    column :description
    column :tag_list
    column :user
    column :published
    default_actions
  end

end
