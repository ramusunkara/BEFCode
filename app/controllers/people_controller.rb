class PeopleController < ApplicationController
  expose(:raw_selected_tag) { Tag.where(title: tag_title).first }
  expose(:selected_tag) { raw_selected_tag.decorate if raw_selected_tag }
  expose(:tags) { Tag.all.decorate }
  expose(:tag_title) { params[:tag_title] }
  expose(:people) { Person.for_tag_title(tag_title).decorate }

  def index
  end

  def mentors
  end
end
