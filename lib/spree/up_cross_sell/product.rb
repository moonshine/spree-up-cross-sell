module Spree::UpCrossSell::Product

  def self.included(target)
    target.class_eval do
      has_many :sales_relationships, :dependent => :destroy
      has_many :cross_sells
      has_many :up_sells
      has_many :complements
      has_many :substitutes

      has_many :cross_sell_products, :through => :cross_sells, :source => :related_product
      has_many :up_sell_products, :through => :up_sells, :source => :related_product
      has_many :complementary_products, :through => :complements, :source => :related_product
      has_many :substitute_products, :through => :substitutes, :source => :related_product
    end
  end

end
