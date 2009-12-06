require 'spec_helper'


describe User do
  fixtures :exercisegroups,:users, :instances, :courses
  
  before(:each) do
    @valid_attributes = {
      "login" => "jani_test",
      "realname" => "jani k",
      "studentnum" => "13123213",
      "email" => "jani@fdfdfdsfstest.fi",
      "password" => "password",
      "password_confirmation" => "password"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
  
  it "should be able to register to exercise group" do
    u = User.create!(@valid_attributes)

    e = Exercisegroup.first
    e.register_user(u).should == true
    
    e.users.include?(u).should == true
  end
  
  it "should be able to register to exercise group only once" do
    u = User.create!(@valid_attributes)
    e = Exercisegroup.first

    e.register_user(u).should == true

    e.reload
    
    e.register_user(u).should == false
    
  end


  it "should be able to have friends" do
  
   ua = User.find 1
   ub = User.find 2
   
   ua.friends.include?(ub).should == false # not friends yet
   
   ua.be_friend_with(ub)
   
   ua.reload
   ub.reload
   
   ua.friends.include?(ub).should == true
   ub.friends.include?(ua).should == true
   
   
  end
      
  
  
end
