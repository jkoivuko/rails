class User < ActiveRecord::Base

   validates_length_of :login, :within => 1..40
   validates_length_of :hashed_password, :within => 1..40
   validates_presence_of :login, :hashed_password, :studentnum, :realname
   validates_uniqueness_of :login
   validates_confirmation_of :hashed_password



  def self.authenticate(login, pass)
    user = User.find_by_login(login)
    return nil if user.nil?
    
    return user if self.encrypt(pass) == user.hashed_password
    nil
  end  

protected

  def self.encrypt(pass)
    Digest::SHA1.hexdigest(pass)
  end



end
