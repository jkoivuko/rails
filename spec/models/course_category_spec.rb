require 'spec_helper'

describe CourseCategory do
  before(:each) do
    @valid_attributes = {
      :course_id => 1,
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    CourseCategory.create!(@valid_attributes)
  end
  
  it "should be assignable to a course" do
  
    Course.first.course_category = CourseCategory.create!(@valid_attributes)
  
    Course.first.course_category.name.should == "value for name"
      
  end
  
end
