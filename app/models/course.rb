class Course < ActiveRecord::Base
  
  validates_presence_of :name, :description
  has_many :instances, :dependent => :destroy
  has_many :exercisegroups, :through => :instances 
  
  named_scope :all_in_order, :order => "name ASC"
  
  
  def users
    self.instances.map(&:users).flatten       
  end
  
end
