class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show, :index ]
  def show
    @event = Event.find(params[:id])

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
        price_data: {
          currency: 'gbp',
          unit_amount: (@event.price * 100).to_i,
          product_data: {
            name: 'Your order',
            description: 'Event',
            images: ['https://example.com/t-shirt.png'],
          },
        },
        quantity: 1
      }],
      mode: 'payment',
      success_url: 'http://localhost:3000/events',
      cancel_url: 'http://localhost:3000/events'
    )

    @event.update(checkout_session_id: session.id)

    @event = Event.find(params[:id])
    # The `geocoded` scope filters only flats with coordinates
    @markers_new = @event.geocode
    @markers = { lat: @markers_new[0], lng: @markers_new[1]}

  end

  def index
    @events = Event.all.order(date_details: "ASC")
    if params[:query].present?
      if params[:query].present?
        sql_query = "name ILIKE :query OR location ILIKE :query OR venue ILIKE :query"
        @events = Event.where(sql_query, query: "%#{params[:query]}%")
      # @events = Event.global_search(params[:query])
      else
        @events = Event.all.order(date_details: "ASC")
      end
    else
      # location
      if params[:location] == "Birmingham"
        @events = Event.where(location: "Birmingham").order(date_details: "ASC")
      elsif params[:location] == "London"
        @events = Event.where(location: "London").order(date_details: "ASC")
      elsif params[:location] == "Glasgow"
        @events = Event.where(location: "Glasgow").order(date_details: "ASC")
      elsif params[:location] == "Manchester"
        @events = Event.where(location: "Manchester").order(date_details: "ASC")
      elsif params[:location] == "Newcastle Upon Tyne"
        @events = Event.where(location: "Newcastle Upon Tyne").order(date_details: "ASC")
      elsif params[:location] == "Liverpool"
        @events = Event.where(location: "Liverpool").order(date_details: "ASC")
      elsif params[:location] == "Belfast"
        @events = Event.where(location: "Belfast").order(date_details: "ASC")
      elsif params[:location] == "Leeds"
        @events = Event.where(location: "Leeds").order(date_details: "ASC")
      elsif params[:location] == "Edinburgh"
        @events = Event.where(location: "Edinburgh").order(date_details: "ASC")
      # category
      elsif params[:category] == "Hip Hop"
        @events = Event.where(category: "Hip Hop").order(date_details: "ASC")
      elsif params[:category] == "Jazz"
        @events = Event.where(category: "Jazz").order(date_details: "ASC")
      elsif params[:category] == "Sports"
        @events = Event.where(category: "Sports").order(date_details: "ASC")
      elsif params[:category] == "Country"
        @events = Event.where(category: "Country").order(date_details: "ASC")
      elsif params[:category] == "Alternative"
        @events = Event.where(category: "Alternative").order(date_details: "ASC")
      elsif params[:category] == "Pop"
        @events = Event.where(category: "Pop").order(date_details: "ASC")
      elsif params[:category] == "Rock"
        @events = Event.where(category: "Rock").order(date_details: "ASC")
      elsif params[:category] == "R&B"
        @events = Event.where(category: "R&B").order(date_details: "ASC")

      end
    end
  end

  def purchase
    @event = Event.find(params[:event_id])


  end
end
