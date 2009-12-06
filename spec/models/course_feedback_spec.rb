require 'spec_helper'

describe CourseFeedback do
  before(:each) do
    @valid_attributes = {
      :instance_id => 1,
      :message => "value for message"
    }
  end

  it "should create a new instance given valid attributes" do
    CourseFeedback.create!(@valid_attributes)
  end
  
  it "should be assignable for a course instance" do
  
    Instance.first.course_feedbacks << CourseFeedback.create!(@valid_attributes)
    
  end

end
