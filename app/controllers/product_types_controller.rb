class ProductTypesController < ApplicationController
  before_action :logged_in_user

  def index
  	@product_types = ProductType.where("active = ?", true)
  end

  def show
  	@product_type = ProductType.find(params[:id])
  	@products = @product_type.products
  end

  def new
  	@product_type = ProductType.new
  end

  def create
    @product_type = ProductType.new(product_type_params)

    respond_to do |format|
      if @product_type.save
        format.html { redirect_to product_types_path, notice: 'Product Type was successfully created.' }
        format.json { render :show, status: :created, location: @product_type }
      else
        format.html { render :new }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_type_params
      params.require(:product_type).permit(:name, :description, :active)
    end

end
