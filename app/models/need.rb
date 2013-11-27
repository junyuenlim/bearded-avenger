class Need < ActiveRecord::Base
  attr_accessible :current, :goal, :project_id, :start, :title, :success

  belongs_to :project
end
