json.extract! checkin, :id, :startDate, :endDate, :checkinTime, :checkoutTime, :numberOfGuests, :total, :customerId, :hotelId, :roomNumber, :paymentId, :created_at, :updated_at
json.url checkin_url(checkin, format: :json)
