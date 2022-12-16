require "json"
require "open-uri"

class Event < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :orders
  validates :name, :location, :date_details, :venue, :url, :category, presence: true
  validates :url, uniqueness: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def api
    # If statment at end converts Hip%Hop to Hip Hop
    genres = ["Alternative", "Hip Hop", "R&B", "Sports", "Pop", "Rock"]
    page_numbers = ["0", "1"]

    genres.each do |genre|
      page_numbers.each do |page|

        url = "https://app.ticketmaster.com/discovery/v2/events.json?countryCode=GB&classificationName=#{genre}&source=ticketmaster&page=#{page}&size=190&&apikey=KGmtnwtGi76iuFD7oCIJzOWKeEAMGcPu"
        user_serialized = URI.open(url).read
        user = JSON.parse(user_serialized)

        user["_embedded"]["events"].each do |event|
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
    end

    genres = ["Jazz", "Country"]

    genres.each do |genre|

      url = "https://app.ticketmaster.com/discovery/v2/events.json?countryCode=GB&classificationName=#{genre}&source=ticketmaster&page=0&size=190&&apikey=KGmtnwtGi76iuFD7oCIJzOWKeEAMGcPu"
      user_serialized = URI.open(url).read
      user = JSON.parse(user_serialized)

      user["_embedded"]["events"].each do |event|
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
  end
end
