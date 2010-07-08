class Admin::SalesRelationshipsController < Admin::BaseController
  resource_controller
  before_filter :load_object, :only => [:selected, :available]

  belongs_to :product

  def selected
    @up_sell_products = @product.up_sell_products
  end

  def available
    if params[:q].blank?
      @available_up_sell_products = []
    else
      @available_up_sell_products = Product.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:q].downcase}%"])
    end
    @available_up_sell_products.delete_if { |product| @product.up_sell_products.include?(product) }
    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end
  end
  
  def remove
    @product = Product.find_by_param!(params[:product_id])
    product = Product.find_by_permalink(params[:id])
    @product.up_sell_products.delete(product)
    @up_sell_products = @product.up_sell_products
    render :layout => false
  end

  def select
    @product = Product.find_by_param!(params[:product_id])
    product = Product.find_by_permalink(params[:id])
    @product.up_sell_products << product
    @up_sell_products = @product.up_sell_products
    render :layout => false
  end

end
