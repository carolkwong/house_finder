json.extract! apartment, :id, :status, :address, :price, :latitude, :longtitude, :decimal, :district, :description, :size, :year_built, :bedrooms, :elevator, :furnished, :user, :created_at, :updated_at
json.url apartment_url(apartment, format: :json)
