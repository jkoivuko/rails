class Course < ActiveRecord::Base
  
  validates_presence_of :name, :description
  has_many :instances, :dependent => :destroy
  has_many :exercisegroups, :through => :instances 
  has_many :separate_exams, :dependent => :destroy
  
  # experiment
  has_many :course_feedbacks, :through => :instances
  
  named_scope :all_in_order, :order => "name ASC"
  
  
  def users
    self.instances.map(&:users).flatten       
  end
  
end
