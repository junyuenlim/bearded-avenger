class Relationship < ActiveRecord::Base
  attr_accessible :followedproject_id, :follower_id

  belongs_to :user, foreign_key: "follower_id"
  belongs_to :project, foreign_key: "followedproject_id"
  validates :follower_id, presence: true
  validates :followedproject_id, presence: true
end
