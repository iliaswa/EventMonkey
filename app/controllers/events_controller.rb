class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
    if params[:query].present?
      if params[:query].present?
        sql_query = "name ILIKE :query OR venue ILIKE :query"
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
      elsif params[:category] == "RnB"
        @events = Event.where(category: "RnB")

      end
    end
  end
end
