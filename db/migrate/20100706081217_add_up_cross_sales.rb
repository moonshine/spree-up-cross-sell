class AddUpCrossSales < ActiveRecord::Migration
  def self.up
    create_table :up_cross_sales, {:id => false} do |t|
      t.references :product
      t.column :up_cross_sale_product_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :up_cross_sales
  end
end