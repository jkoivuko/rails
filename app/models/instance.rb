class Instance < ActiveRecord::Base
  
  has_many :exercisegroups, :dependent => :destroy
  #has_many :users, :through => :exercisegroups, :source => :registrations
  belongs_to :course
  
  has_many :course_feedbacks, :dependent => :destroy
  
  def users
    self.exercisegroups.map(&:users).flatten    
  end
  
end
