# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri"
puts "Destroying all"
Event.destroy_all
User.destroy_all

admin_user = User.create({ first_name: "John", last_name: "Doe", email: "test@test.com", password: "123456", handle: "john"})
#event_1 = Event.create({ name: "Adele Tribute", description: "Incredible artist's songs all day long", location: "London", date_details: DateTime.new(2022,11,12,19), price: 35.00, venue: "O2 Brixton", url: "https://www.ticketmaster.co.uk/adele-tickets/artist/1159272", category: "Pop", lng: 51.5072, lat: 0.1276, image_url: "https://media.ticketmaster.co.uk/tm/en-gb/dam/a/551/eecce133-8e2f-4e56-ae45-45909f7a7551_1170241_CUSTOM.jpg" })

# Replaced Metal with Sports and Blues with Hip%Hop (If statment at line 50 converts Hip%Hop to Hip Hop)
genres = ["Alternative", "Hip Hop", "Country", "R&B", "Jazz", "Sports", "Pop", "Rock"]

genres.each do |genre|

  url = "https://app.ticketmaster.com/discovery/v2/events.json?size=101&classificationName=#{genre}&countryCode=GB&source=ticketmaster&&apikey=KGmtnwtGi76iuFD7oCIJzOWKeEAMGcPu"
  user_serialized = URI.open(url).read
  user = JSON.parse(user_serialized)

  user["_embedded"]["events"].each_with_index do |event, index|
    # puts event["priceRanges"].nil?
    next event if event["priceRanges"].nil? || event["dates"]["start"]["dateTime"].nil?

      name = event["name"]

      description = "none"

      venue = event["_embedded"]["venues"][0]["name"]

      location = event["_embedded"]["venues"][0]["city"]["name"]

      date_details =  event["dates"]["start"]["dateTime"].to_datetime

      category = "#{genre}"

      price = event["priceRanges"][0]["min"].to_f unless event["priceRanges"].nil?

      url = event["url"]

      image_url = event["images"].last["url"]

      event = Event.create!({
        name: name,
        description: description,
        venue: venue,
        location: location,
        date_details: date_details,
        category: category,
        price: price,
        url: url,
        image_url: image_url})
        puts "Creating event #{event.name}"
  end
end
