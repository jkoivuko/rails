require 'spec_helper'

describe Course do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "description"
    }
  end

  it "should create a new instance given valid attributes" do
    Course.create!(@valid_attributes)
  end
  
  it "should be able to find by category" do
  
    Course.first.course_category = CourseCategory.create!(:name => "important")
    
    Course.find_by_category("important").should == Course.first
    
      
  end
  
end
