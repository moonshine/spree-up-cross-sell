# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class UpCrossSellExtension < Spree::Extension
  version "1.0"
  description "Allows up/cross sell products to be setup"
  url "http://yourwebsite.com/up_cross_sell"

  # Please use up_cross_sell/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate
    Product.send(:include, Spree::UpCrossSell::Product)
  end
end
