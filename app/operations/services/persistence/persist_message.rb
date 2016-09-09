class PersistMessage
  def execute(message)
  	if message.save
  	else
  	  message = nil
  	end
  	message
  end
end