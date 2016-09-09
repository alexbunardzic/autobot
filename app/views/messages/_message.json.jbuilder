json.extract! message, :id, :conversation_id, :intent_id, :body, :created_at, :updated_at
json.url message_url(message, format: :json)