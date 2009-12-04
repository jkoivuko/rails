class Registration < ActiveRecord::Base

  belongs_to :user
  belongs_to :exercisegroup
  
  def to_label
      name = Exercisegroup.find(exercisegroup_id).name
  end
    
end
