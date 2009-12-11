class Exercisegroup < ActiveRecord::Base
  #named_scope :red, :conditions => {:color => 'red'}
  belongs_to :instance
  #has_and_belongs_to_many :users
  has_many :registrations
  has_many :users, :through => :registrations
  #has_one :course, :through => :instances
  
  validates_presence_of     :name
  validates_presence_of     :size # max groups size
  validates_presence_of     :room
  validates_presence_of     :start_date
  validates_presence_of     :end_date
  
  
  def register_user(user)
    unless self.instance.users.include?(user) || self.size == self.users.size 
      self.users << user
      return true
    end
    false
  end
  
  
end
