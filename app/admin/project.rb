ActiveAdmin.register Project do
	index do
        column :title
        column :description
        column :tag_list
        default_actions
	end

	form do |f|
    f.inputs "Project Details" do
      f.input :title
      f.input :description
      f.input :tag_list
    end
    f.buttons
  end
end