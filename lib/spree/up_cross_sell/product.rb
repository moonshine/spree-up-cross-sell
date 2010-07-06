module Spree::UpCrossSell::Product

  def self.included(target)
    target.class_eval do
      # Association for up/cross sell products
      has_and_belongs_to_many :up_cross_sales, :class_name => "Product", :join_table => "up_cross_sales" , :association_foreign_key => "up_cross_sale_product_id"
    end
  end

end
