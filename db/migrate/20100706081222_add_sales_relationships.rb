class AddSalesRelationships < ActiveRecord::Migration
  def self.up
    create_table :sales_relationships  do |t|
      t.references :product
      t.integer :related_product_id, :null => false
      t.string :type
      t.timestamps
    end
  end

  def self.down
    drop_table :sales_relationships
  end
end