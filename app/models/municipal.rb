class Municipal < ActiveRecord::Base
  extend FriendlyId
  friendly_id :acronym, use: :history

  attr_accessible :acronym, :name

  has_many :neighbourhoods

  def name_acronym
    "#{acronym} - #{name}"
  end
end
