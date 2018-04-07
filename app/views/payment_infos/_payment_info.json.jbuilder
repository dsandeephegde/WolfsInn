json.extract! payment_info, :id, :SSN, :billingAddress, :City, :State, :Country, :paymentMethod, :cardNumber, :customerId, :created_at, :updated_at
json.url payment_info_url(payment_info, format: :json)
