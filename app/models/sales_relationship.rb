class SalesRelationship < ActiveRecord::Base
  belongs_to :product
  belongs_to :related_product, :class_name => "Product"
end