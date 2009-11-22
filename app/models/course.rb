class Course < ActiveRecord::Base
  
  validates_presence_of :name, :description
  has_many :instances
  
end
