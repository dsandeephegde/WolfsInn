json.extract! room_price, :id, :category, :maxOccupancy, :price, :created_at, :updated_at
json.url room_price_url(room_price, format: :json)
