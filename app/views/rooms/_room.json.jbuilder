json.extract! room, :id, :roomNumber, :hotelId, :category, :maxOccupancy, :availability, :created_at, :updated_at
json.url room_url(room, format: :json)
