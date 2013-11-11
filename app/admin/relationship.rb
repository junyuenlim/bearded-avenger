ActiveAdmin.register Relationship do

	index do
        column :id
        column :followedproject_id
        column :follower_id
        default_actions
	end

end