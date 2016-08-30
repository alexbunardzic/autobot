class BrandsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    @product = Product.find(params[:brand][:product_id])
    @brand.product_id = params[:brand][:product_id]

    respond_to do |format|
      if @brand.save
        format.html { redirect_to show_product_types_path(@product.product_type_id), notice: 'Brand was successfully created.' }
        format.json { render :show, status: :created, location: @brand }
      else
        format.html { render :new }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def brand_params
      params.require(:brand).permit(:name, :description, :active)
    end

end
