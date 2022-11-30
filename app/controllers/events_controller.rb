class EventsController < ApplicationController
  def show
    @event = Event.find(:id)
  end

  def index
    @events = Event.all
  end
end
