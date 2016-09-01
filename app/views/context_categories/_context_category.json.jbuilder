json.extract! context_category, :id, :name, :description, :active, :created_at, :updated_at
json.url context_category_url(context_category, format: :json)