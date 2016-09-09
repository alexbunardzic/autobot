json.extract! context, :id, :name, :description, :active, :created_at, :updated_at
json.url context_url(context, format: :json)