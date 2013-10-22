class WelcomeController < ApplicationController
  expose(:board_members) { Person.mentors.decorate }
  expose(:past_events) { Event.past_events.decorate }
  expose(:upcoming_events) { Event.upcoming_events.decorate }

  def index
  end

  def about
  end

  def contact
  end
end