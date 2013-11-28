class EventsController < ApplicationController
  expose(:events) { Event.published.decorate }
  expose(:event) { Event.where(slug: params[:id]).first.decorate }

  def index
  end

  def show
  end
end
