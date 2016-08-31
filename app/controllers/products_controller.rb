class ProductsController < ApplicationController
  def new
    @product_type = ProductType.find(params[:product_type_id])
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
    @brands = @product.brands
  end

  def create
    @product = Product.new(product_params)
    @product_type = ProductType.find(params[:product][:product_type_id])
    @product.product_type_id = params[:product][:product_type_id]

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product_type, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :active)
    end

end
