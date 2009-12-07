class Course < ActiveRecord::Base
  
  validates_presence_of :name, :description
  has_many :instances, :dependent => :destroy
  has_many :exercisegroups, :through => :instances 
  has_many :separate_exams, :dependent => :destroy
  
  # experiment
  has_many :course_feedbacks, :through => :instances
  belongs_to :course_category
  
  named_scope :all_in_order, :order => "name ASC"
  
  
  def users
    self.instances.map(&:users).flatten       
  end
  
  # could be made with named scope? 
  def self.all_in_category(category)
    cat = CourseCategory.find_by_name(category)
    Course.find(:all, :conditions => ['course_category_id = ?', cat.id]) unless cat.nil?
  end
  
  
end
