class SearchMessage
  def lookup(message)
  	msg = Message.where("body = ?", message).first
  end
end