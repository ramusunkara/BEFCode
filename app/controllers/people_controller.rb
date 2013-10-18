class PeopleController < ApplicationController
  expose(:tag_title) { params[:tag_title] }
  expose(:people) { Person.for_tag_title(tag_title).decorate }

  def index
  end
end