json.extract! sku, :id, :name, :description, :quantity, :color, :weight, :width, :height, :material, :attributes, :active, :created_at, :updated_at
json.url sku_url(sku, format: :json)