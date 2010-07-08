class Admin::SalesRelationshipsController < Admin::BaseController
  resource_controller
  before_filter :load_object, :only => [:selected, :available]

  belongs_to :product

  def selected
    @sales_relationships = Hash.new
    @sales_relationships['up_sell_products'] = nil
    @sales_relationships['cross_sell_products'] = nil
    @sales_relationships['substitute_products'] = nil
    @sales_relationships['complementary_products'] = nil
    @sales_relationships.each_key do |relationship|
      @sales_relationships[relationship] = instance_variable_set "@#{relationship}", @product.send(relationship)
    end
  end

  def available
    if params[:q].blank?
      @available_relationship_products = []
    else
      @available_relationship_products = Product.find(:all, :conditions => ['lower(name) LIKE ?', "%#{params[:q].downcase}%"])
    end
    @relationship = params[:relationship]
    @available_relationship_products.delete_if { |product| @product.send(@relationship).include?(product) }
    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end
  end
  
  def remove
    process_request(true)
    render :layout => false
  end

  def select
    process_request(false)
    render :layout => false
  end

  private

  def process_request(delete)
    @product = Product.find_by_param!(params[:product_id])
    product = Product.find_by_permalink(params[:id])
    @relationship = params[:relationship]
    if delete
      @product.send(@relationship).delete(product)
    else
      @product.send(@relationship) << product
    end
    @relationship_products = @product.send(@relationship)
  end

end
