class Inspiration < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :discussion_id

  validates :user_id, presence: true
  validates :discussion_id, presence: true

  belongs_to :discussion
  belongs_to :user
end
