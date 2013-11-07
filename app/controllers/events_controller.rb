class EventsController < ApplicationController
  expose(:events) { Event.published.decorate }
  expose(:event) { Event.where(id: params[:id]).first.decorate }

  def index
  end

  def show
  end
end
