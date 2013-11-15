class Discussion < ActiveRecord::Base
  attr_accessible :description, :published, :title

  validates :user_id, presence: true
  belongs_to :user
end
