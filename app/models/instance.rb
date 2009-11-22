class Instance < ActiveRecord::Base
  
  has_many :exercisegroups
  belongs_to :course
  
end
