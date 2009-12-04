require 'spec_helper'

describe Newsfeed do
  before(:each) do
    @valid_attributes = {
      :text => "foo"
    }
  end

  it "should create a new instance given valid attributes" do
    Newsfeed.create!(@valid_attributes)
  end
  
  it "should be appendable with text" do
  
    Newsfeed.append("lorem ipsum")
    
  end
  
end
