class Exercisegroup < ActiveRecord::Base
  #named_scope :red, :conditions => {:color => 'red'}
  belongs_to :instance
  
end
