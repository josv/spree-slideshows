require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/slides/edit" do
  before do
    render 'admin/slides/edit'
  end
  
  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', 'Find me in app/views/admin/slides/edit.rhtml')
  end
end
