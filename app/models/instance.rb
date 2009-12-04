class Instance < ActiveRecord::Base
  
  has_many :exercisegroups, :dependent => :destroy
  #has_many :users, :through => :exercisegroups, :source => :registrations
  belongs_to :course
  
  def users
    self.exercisegroups.map(&:users).flatten    
  end
  
end
