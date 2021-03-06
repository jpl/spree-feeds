# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class FeedsExtension < Spree::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/feeds"

  # Please use feeds/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate
    ProductsController.class_eval do
      index.wants.rss { render :layout => false}
    end
    
    TaxonsController.class_eval do
      show.wants.rss { render :layout => false }
    end
    
    # make your helper avaliable in all views
    # Spree::BaseController.class_eval do
    #   helper YourHelper
    # end
  end
end
