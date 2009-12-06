require 'spec_helper'

describe SeparateExam do
  before(:each) do
    @valid_attributes = {    
      :name => :test,
      :date => "2009-12-06 18:55:46"
    }
  end

  it "should create a new instance given valid attributes" do
    SeparateExam.create!(@valid_attributes)
  end
  
  it "should belong to a Course" do
  
    c = Course.first
    c.separate_exams << SeparateExam.create!(@valid_attributes)
    
  end
  
end
