class IntentsController < ApplicationController
  before_action :set_intent, only: [:show, :edit, :update, :destroy]

  # GET /intents
  # GET /intents.json
  def index
    @intents = Intent.all
  end

  # GET /intents/1
  # GET /intents/1.json
  def show
  end

  # GET /intents/new
  def new
    @intent = Intent.new
    @context = Context.find(params[:context_id])
  end

  # GET /intents/1/edit
  def edit
  end

  # POST /intents
  # POST /intents.json
  def create
    @intent = Intent.new(intent_params)
    @context = Context.find(params[:intent][:context_id])
    @intent.context_id = params[:intent][:context_id]

    respond_to do |format|
      if @intent.save
        format.html { redirect_to @context, notice: 'Intent was successfully created.' }
        format.json { render :show, status: :created, location: @intent }
      else
        format.html { render :new }
        format.json { render json: @intent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intents/1
  # PATCH/PUT /intents/1.json
  def update
    respond_to do |format|
      if @intent.update(intent_params)
        @context = Context.find(@intent.context_id)
        format.html { redirect_to @context, notice: 'Intent was successfully updated.' }
        format.json { render :show, status: :ok, location: @intent }
      else
        format.html { render :edit }
        format.json { render json: @intent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intents/1
  # DELETE /intents/1.json
  def destroy
    @intent.destroy
    respond_to do |format|
      format.html { redirect_to intents_url, notice: 'Intent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intent
      @intent = Intent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def intent_params
      params.require(:intent).permit(:context_id, :name, :description, :active)
    end
end
