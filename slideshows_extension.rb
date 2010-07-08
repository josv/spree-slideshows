# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SlideshowsExtension < Spree::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/slideshows"

  # Please use slideshows/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate

    # make your helper avaliable in all views
    Spree::BaseController.class_eval do
      helper SlideshowsHelper
    end
  end
end
