class Inspiration < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :discussion_id, :image, :image_remote_url

  validates :user_id, presence: true
  validates :discussion_id, presence: true
  has_attached_file :image, styles: { thumbnail: "560x400>"},
  					default_url: '/assets/graphics/missing_thumbnail.jpg'
  validates_attachment :image, 
                        content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                        size: { less_than: 5.megabytes }

  belongs_to :discussion
  belongs_to :user

  def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end
end
