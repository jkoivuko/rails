class Course < ActiveRecord::Base
  
  validates_presence_of :name, :description
  has_many :instances, :dependent => :destroy

  named_scope :all_in_order, :order => "name ASC"
end
