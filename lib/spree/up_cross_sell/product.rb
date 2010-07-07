module Spree::UpCrossSell::Product

  def self.included(target)
    target.class_eval do
      has_and_belongs_to_many :up_sells, :class_name => "Product", :join_table => "sales_relationships", :association_foreign_key => "up_sell_product_id"
      has_and_belongs_to_many :cross_sells, :class_name => "Product", :join_table => "sales_relationships", :association_foreign_key => "cross_sell_product_id"
      has_and_belongs_to_many :substitues, :class_name => "Product", :join_table => "sales_relationships", :association_foreign_key => "substitutes_product_id"
      has_and_belongs_to_many :complements, :class_name => "Product", :join_table => "sales_relationships", :association_foreign_key => "complements_product_id"
    end
  end

end
