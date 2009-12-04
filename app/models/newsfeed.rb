class Newsfeed < ActiveRecord::Base

  
  named_scope :latest, :order => "created_at DESC", :limit => 10
  

  def self.append(text)
    f = Newsfeed.new(:text => text)
    f.save!
  end

end
