require 'spec_helper'

describe Exercisegroup do
  before(:each) do
    @valid_attributes = {
        :room => "A123",
        :name => "Eka",
        :date => Date.parse("2009-12-06"),
        :instance_id => 1,
        :start_date => Date.parse("2009-12-06 18:50:46"),
        :end_date => Date.parse("2009-12-06 18:55:46"),
        :size => "2"
    }
  end

  it "should create a new instance given valid attributes" do
    Exercisegroup.create!(@valid_attributes)
  end
  
  it "should be able to register into with users" do
      
    e = Exercisegroup.first
    e.register_user(User.first)
       
  end
  
  it "should not allow to register more than 2 users" do
    
    e = Exercisegroup.create!(@valid_attributes) # max size is 2
    e.register_user(User.find(1)).should == true
    e.register_user(User.find(2)).should == true

    e.register_user(User.find(3)).should == false
    e.registrations.size.should == 2
    
  
  end

end
