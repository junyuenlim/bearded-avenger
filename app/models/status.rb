class Status < ActiveRecord::Base
  include PublicActivity::Common
  
  attr_accessible :description, :title, :project_id

  validates :project_id, presence: true

  belongs_to :project
end
