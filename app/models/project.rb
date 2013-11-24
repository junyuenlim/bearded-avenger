class Project < ActiveRecord::Base
  is_impressionable
  acts_as_votable

  attr_accessible :description, :title, :thumbnail, :tag_list, :published, :city_list

  acts_as_taggable
  acts_as_taggable_on :categories, :city

  validates :user_id, presence: true
  has_attached_file :thumbnail, styles: { medium: "560x400>"},
  					default_url: '/assets/graphics/missing_thumbnail.jpg'
  validates_attachment :thumbnail, 
                        content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                        size: { less_than: 5.megabytes }

  belongs_to :user
  # has_many :relationships, foreign_key: "followedproject_id"
  has_many :followers, through: :relationships, source: :user
end
