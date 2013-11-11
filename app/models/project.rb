class Project < ActiveRecord::Base
  attr_accessible :description, :title

  belongs_to :user
  validates :user_id, presence: true
end
