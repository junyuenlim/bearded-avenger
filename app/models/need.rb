class Need < ActiveRecord::Base
  include PublicActivity::Common
  
  attr_accessible :current, :goal, :project_id, :start, :title, :success

  validates :project_id, presence: true

  belongs_to :project
end
