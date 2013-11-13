ActiveAdmin.register Project do
	index do
        column :title
        column :description
        column :tag_list
        column :published
        default_actions
	end

	form do |f|
    f.inputs "Project Details" do
      f.input :title
      f.input :description, :rows => "10"
      f.input :tag_list
      f.input :published
    end
    f.buttons
  end
end