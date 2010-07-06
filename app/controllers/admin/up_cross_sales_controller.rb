class Admin::UpCrossSalesController < Admin::BaseController
  resource_controller
  before_filter :load_object, :only => [:selected, :available, :remove]

  belongs_to :product

  def selected
    @up_cross_sales = @product.up_cross_sales
  end

  def available
    if params[:q].blank?
      @available_up_cross_sales = []
    else
      @available_up_cross_sales = Product.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:q].downcase}%"])
    end
    @available_up_cross_sales.delete_if { |accessory| @product.up_cross_sales.include?(accessory) }
    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end

  end


  def remove
    @product.up_cross_sales.delete(@up_cross_sale)
    @product.save
    @up_cross_sales = @product.up_cross_sales
    render :layout => false
  end

  def select
    @product = Product.find_by_param!(params[:product_id])
    accessory = Product.find_by_permalink(params[:id])
    @product.up_cross_sales << accessory
    @product.save
    @up_cross_sales = @product.up_cross_sales
    render :layout => false
  end

end
