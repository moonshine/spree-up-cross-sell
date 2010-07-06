# Put your extension routes here.

map.namespace :admin do |admin|
   admin.resources :products do |product|
     product.resources :up_cross_sales, :member => {:select => :post, :remove => :post}, :collection => {:available => :post, :selected => :get}
   end
end
