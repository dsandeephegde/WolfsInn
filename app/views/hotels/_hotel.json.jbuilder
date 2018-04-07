json.extract! hotel, :id, :Name, :Address, :City, :State, :Country, :phoneNumber, :managerId, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)
