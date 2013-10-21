class WelcomeController < ApplicationController
  expose(:board_members) { Person.mentors.decorate }

  def index
  end

  def about
  end

  def contact
  end
end