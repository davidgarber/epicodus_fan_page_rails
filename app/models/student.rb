require 'textacular'

class Student < ActiveRecord::Base.extend(Textacular)
  has_many :projects
  validates :name, :presence => true
end
