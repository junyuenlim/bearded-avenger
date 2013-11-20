class Discussion < ActiveRecord::Base
  attr_accessible :description, :published, :title, :cover, :city_list

  acts_as_taggable
  acts_as_taggable_on :city

  validates :user_id, presence: true
  has_attached_file :cover, styles: { medium: ["1400x600>", :jpg], thumb: ["560x400#", :jpg] }
  validates_attachment :cover, presence: true,
                        content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                        size: { less_than: 5.megabytes }

  belongs_to :user
  has_many :inspirations
end
