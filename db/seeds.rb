# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#event_1 = Event.create({ name: "Adele Tribute", description: "Incredible artist's songs all day long", location: "London", date_details: DateTime.new(2022,11,12,19), price: 35.00, venue: "O2 Brixton", url: "https://www.ticketmaster.co.uk/adele-tickets/artist/1159272", category: "Pop", lng: 51.5072, lat: 0.1276, image_url: "https://media.ticketmaster.co.uk/tm/en-gb/dam/a/551/eecce133-8e2f-4e56-ae45-45909f7a7551_1170241_CUSTOM.jpg" })

admin_user = User.create({ first_name: "John", last_name: "Doe", email: "test@test.com", password: "123456", handle: "john"})
