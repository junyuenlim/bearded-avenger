class Project < ActiveRecord::Base
  attr_accessible :description, :title

  belongs_to :user
  validates :user_id, presence: true

  has_many :relationships, foreign_key: "followedproject_id"
  has_many :followers, through: :relationships, source: :user
end
