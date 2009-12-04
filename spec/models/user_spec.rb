require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      "login" => "jani",
      "realname" => "jani k",
      "studentnum" => "13123213",
      "email" => "jani@fdfdfdsfs.fi",
      "password" => "password",
      "password_confirmation" => "password"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
  
  it "should be able to register to exercise group" do
    u = User.create!(@valid_attributes)

    c = Course.new(:name => "test", :description => "foo")
    i = Instance.new
    e = Exercisegroup.new
    c.instances << i
    i.exercisegroups << e
    c.save!
    i.save!
    
    e.register_user(u).should == true
    
    e.users.include?(u).should == true
  end
  
  it "should be able to register to exercise group only once" do
    u = User.create!(@valid_attributes)

    c = Course.new(:name => "test", :description => "foo")
    i = Instance.new
    e = Exercisegroup.new
    c.instances << i
    i.exercisegroups << e
    c.save!
    i.save!
    
    e.register_user(u).should == true
    
    e.reload
    
    e.register_user(u).should == false
    
  end
  
  
  
end
