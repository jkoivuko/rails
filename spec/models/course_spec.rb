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
  
    c = Course.find(1)
    c.course_category = CourseCategory.create(:name => "important")
    c.save!
    
    Course.all_in_category("important").include?(Course.find(1)).should == true
    
      
  end
  
end
