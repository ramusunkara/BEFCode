class PeopleController < ApplicationController
  expose(:people) { Person.all.decorate }

  def index
  end
end