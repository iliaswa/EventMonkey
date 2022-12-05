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
  end

  def index
    @events = Event.all
    if params[:query].present?
      if params[:query].present?
        sql_query = "name ILIKE :query OR location ILIKE :query OR venue ILIKE :query"
        @events = Event.where(sql_query, query: "%#{params[:query]}%")
      # @events = Event.global_search(params[:query])
      else
        @events = Event.all
      end
    else
      # location
      if params[:location] == "Birmingham"
        @events = Event.where(location: "Birmingham")
      elsif params[:location] == "London"
        @events = Event.where(location: "London")
      elsif params[:location] == "Glasgow"
        @events = Event.where(location: "Glasgow")
      elsif params[:location] == "Newcastle Upon Tyne"
        @events = Event.where(location: "Newcastle Upon Tyne")
      # category
      elsif params[:category] == "Hip Hop"
        @events = Event.where(category: "Hip Hop")
      elsif params[:category] == "Jazz"
        @events = Event.where(category: "Jazz")
      elsif params[:category] == "Sports"
        @events = Event.where(category: "Sports")
      elsif params[:category] == "Country"
        @events = Event.where(category: "Country")
      elsif params[:category] == "Alternative"
        @events = Event.where(category: "Alternative")
      elsif params[:category] == "Pop"
        @events = Event.where(category: "Pop")
      elsif params[:category] == "Rock"
        @events = Event.where(category: "Rock")
      elsif params[:category] == "R&B"
        @events = Event.where(category: "R&B")

      end
    end
  end

  def purchase
    @event = Event.find(params[:event_id])


  end
end
