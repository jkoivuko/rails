class Instance < ActiveRecord::Base
  
  has_many :exercisegroups, :dependent => :destroy
  belongs_to :course
  
end
