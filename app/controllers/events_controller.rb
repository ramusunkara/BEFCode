class EventsController < ApplicationController
  expose(:events) { Event.published.decorate }

  def index
  end
end
