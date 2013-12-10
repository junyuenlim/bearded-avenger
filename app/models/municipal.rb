class Municipal < ActiveRecord::Base
  attr_accessible :acronym, :name

  has_many :neighbourhoods

  def name_acronym
    "#{acronym} - #{name}"
  end
end
