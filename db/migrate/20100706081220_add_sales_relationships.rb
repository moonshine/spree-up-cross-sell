class AddSalesRelationships < ActiveRecord::Migration
  def self.up
    create_table :sales_relationships, {:id => false}  do |t|
      t.references :product
      t.integer :up_sell_product_id
      t.integer :cross_sell_product_id
      t.integer :substitute_product_id
      t.integer :complement_product_id
      t.timestamps
    end
  end

  def self.down
    drop_table :sales_relationships
  end
end