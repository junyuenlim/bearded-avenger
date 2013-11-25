class Discussion < ActiveRecord::Base
  include PublicActivity::Common

  is_impressionable

  acts_as_commentable
  
  attr_accessible :description, :published, :title, :cover, :city_list

  acts_as_taggable
  acts_as_taggable_on :city

  validates :user_id, presence: true
  has_attached_file :cover, styles: { medium: ["1400x600>", :jpg], thumb: ["560x400#", :jpg] },
                    default_url: '/assets/graphics/missing_thumbnail.jpg'
  validates_attachment :cover,
                        content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                        size: { less_than: 5.megabytes }

  belongs_to :user
  has_many :inspirations
end
