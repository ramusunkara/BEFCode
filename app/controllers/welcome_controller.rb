class WelcomeController < ApplicationController
  expose(:board_members) { Person.mentors.decorate }
  expose(:past_events) { Event.past_events.limit(3).decorate }
  expose(:event) { Event.next_or_last.decorate }

  def index
  end

  def about
  end

  def contact
  end
end