require './app/operations/services/queries/search_message'

class ProcessMessage
  def execute(message)
  	result = Hash.new
  	search_message ||= SearchMessage.new
  	msg = search_message.lookup(message)
  	if !msg.nil?
  	  result["message"] = msg
  	  result["intent_id"] = check_if_categorized(msg) if !msg.nil?
  	end
  	result
  end

  def check_if_categorized(msg)
  	intent_id = 0
  	categorized = CategorizedMessage.where("message_id = ?", msg.id)
  	intent_id = categorized.first.intent_id if categorized.size > 0
  	intent_id
  end
end