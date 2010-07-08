require File.dirname(__FILE__) + '/../spec_helper'

describe Slide do
  before(:each) do
    @slide = Slide.new
  end

  it "should be valid" do
    @slide.should be_valid
  end
end
