require 'textacular'

class Project < ActiveRecord::Base.extend(Textacular)
  belongs_to :student

  validates :title, :presence => true
  validates :description, :presence => true
  validates :url, :presence => true
end
