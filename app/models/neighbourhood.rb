class Neighbourhood < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :history
  
  attr_accessible :name, :municipal_id

  validates :name, presence: true

  belongs_to :municipal

  def municipal_name
    municipal.try(:name)
  end

  def municipal_name=(name)
    self.municipal = Municipal.find_or_create_by_name(name) if name.present?
  end

  has_many :users
end
