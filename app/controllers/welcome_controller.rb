class WelcomeController < ApplicationController
  expose(:board_members) { Person.board_members.decorate }
  expose(:past_events) { Event.past_events.without(raw_event).limit(3).decorate }
  expose(:event) { raw_event.decorate if raw_event }
  expose(:raw_event) { Event.next_or_last }

  def index
  end

  def about
  end
end