puts("Removing Photos...")
Photo.destroy_all
puts("Removing Apartments...")
Apartment.destroy_all
puts("Removing Users...")
User.destroy_all

puts("Creating Users...")
jason = User.create(email: "jason.lam@preface.education", password:"123123")
test_user = User.create(email: "aa@bb.cc", password:"123123")

puts("Creating Apartment and photos...")
apartment1 = Apartment.create(user: jason, status: "Available", address: "38 San Ma Tau St, Ma Tau Kok", price: 4180000, size: 287, year_built: 2005, bedrooms: 2, elevator: true, furnished: true, latitude: 22.3192425, longtitude: 114.1927562)
photo1 = Photo.create(apartment: apartment1)
photo1.remote_img_url = "https://res.cloudinary.com/preface/image/upload/v1576640330/apartments/apartment_photo_1.png"
photo1.save

puts("Creating Apartment and photos...")
apartment2 = Apartment.create(user: jason, status: "Available", address: "No.400 Castle Peak Road, Lai Chi Kok", price: 8380000, size: 526, year_built: 2015, bedrooms: 2, elevator: true, furnished: true, latitude: 22.3398834, longtitude: 114.1524527)
photo2 = Photo.create(apartment: apartment2)
photo2.remote_img_url = "https://res.cloudinary.com/preface/image/upload/v1576640332/apartments/apartment_photo_2.png"
photo2.save

puts("Creating Apartment and photos...")
apartment3 = Apartment.create(user: test_user, status: "Available", address: "NO.1 KWONG WA STREET, Mong Kok", price: 9280000, size: 774, year_built: 1974, bedrooms: 3, elevator: true, furnished: false, latitude: 22.315951871611652, longtitude: 114.1724177598735)
photo3 = Photo.create(apartment: apartment3)
photo3.remote_img_url = "https://res.cloudinary.com/preface/image/upload/v1576640337/apartments/apartment_photo_3.png"
photo3.save

puts("Creating Apartment and photos...")
apartment4 = Apartment.create(user: test_user, status: "Available", address: "NO.28 SIU SAI WAN ROAD, Chai Wan", price: 13500000, size: 848, year_built: 2001, bedrooms: 3, elevator: true, furnished: true, latitude: 22.2665840, longtitude: 114.2500050)
photo4 = Photo.create(apartment: apartment4)
photo4.remote_img_url = "https://res.cloudinary.com/preface/image/upload/v1576640340/apartments/apartment_photo_4.png"
photo4.save
photo4b = Photo.create(apartment: apartment4)
photo4b.remote_img_url = "https://res.cloudinary.com/preface/image/upload/v1576640608/apartments/apartment_photo_4b.png"
photo4b.save

#TODO : create booking seeds