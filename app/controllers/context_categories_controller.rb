class ContextCategoriesController < ApplicationController
  before_action :set_context_category, only: [:show, :edit, :update, :destroy]

  # GET /context_categories
  # GET /context_categories.json
  def index
    @context_categories = ContextCategory.all
  end

  # GET /context_categories/1
  # GET /context_categories/1.json
  def show
  end

  # GET /context_categories/new
  def new
    @context_category = ContextCategory.new
  end

  # GET /context_categories/1/edit
  def edit
  end

  # POST /context_categories
  # POST /context_categories.json
  def create
    @context_category = ContextCategory.new(context_category_params)

    respond_to do |format|
      if @context_category.save
        format.html { redirect_to @context_category, notice: 'Context category was successfully created.' }
        format.json { render :show, status: :created, location: @context_category }
      else
        format.html { render :new }
        format.json { render json: @context_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /context_categories/1
  # PATCH/PUT /context_categories/1.json
  def update
    respond_to do |format|
      if @context_category.update(context_category_params)
        format.html { redirect_to @context_category, notice: 'Context category was successfully updated.' }
        format.json { render :show, status: :ok, location: @context_category }
      else
        format.html { render :edit }
        format.json { render json: @context_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_categories/1
  # DELETE /context_categories/1.json
  def destroy
    @context_category.destroy
    respond_to do |format|
      format.html { redirect_to context_categories_url, notice: 'Context category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_context_category
      @context_category = ContextCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def context_category_params
      params.require(:context_category).permit(:name, :description, :active)
    end
end
