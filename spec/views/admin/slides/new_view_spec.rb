require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/slides/new" do
  before do
    render 'admin/slides/new'
  end
  
  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', 'Find me in app/views/admin/slides/new.rhtml')
  end
end
