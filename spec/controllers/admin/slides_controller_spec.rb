require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::SlidesController do


  #Delete these examples and add some real ones

  it "should use Admin::SlidesController" do
    controller.should be_an_instance_of(Admin::SlidesController)
  end




  it "GET 'new' should be successful" do
    get 'new'
    response.should be_success
  end


  it "GET 'edit' should be successful" do
    get 'edit'
    response.should be_success
  end


end
