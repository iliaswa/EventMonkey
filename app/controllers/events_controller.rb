class EventsController < ApplicationController
  def show
    #this is a comment
  end
  def index
    @events = Event.all
  end
end
