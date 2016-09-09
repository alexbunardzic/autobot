json.extract! intent, :id, :context_id, :name, :description, :active, :created_at, :updated_at
json.url intent_url(intent, format: :json)