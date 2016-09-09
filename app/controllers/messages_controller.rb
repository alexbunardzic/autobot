require './app/operations/services/persistence/persist_message'
require './app/operations/processing/process_message'

class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @categorized_message = CategorizedMessage.where("message_id = ?", @message.id).first
    @intent = Intent.find(@categorized_message.intent_id)
    @answers = Answer.where("intent_id = ? and automatic <> ?", @intent.id, true).order("upvotes desc")
    if @answers.size > 0
      @top_answer = @answers.first
    else
      @top_answer = Answer.where("intent_id = ?", @intent.id).first
    end
    @ordered_answers = []
    count = 1
    @answers.each do |answer|
      if count > 1
        @ordered_answers << answer
      else
        count += 1
      end
    end
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.body = params[:message][:body].downcase
    persist_message ||= PersistMessage.new
    @message = persist_message.execute(@message)

    respond_to do |format|
      if !@message.nil?
        process_message ||= ProcessMessage.new
        result = process_message.execute(@message.body)
        if result["intent_id"] == 0
          format.html { redirect_to categorize_message_path(@message) }
          format.json { render :show, status: :created, location: @message }
        else
          format.html { redirect_to result["message"], notice: 'Message intent found.' }
          format.json { render :show, status: :created, location: @message }
        end
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def categorize
    @message = Message.find(params[:id])
    @intents = Intent.where("active = ?", true)
  end

  def associate
    @message = Message.find(params[:id])
    @intent = Intent.find(params[:intent_id])
    if !@intent.nil?
      categorized_message = CategorizedMessage.new
      categorized_message.message_id = @message.id
      categorized_message.intent_id = @intent.id
      categorized_message.save
      @answers = Answer.where("intent_id = ?", @intent.id)
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:conversation_id, :intent_id, :body)
    end
end
