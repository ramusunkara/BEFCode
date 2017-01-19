class PeopleController < ApplicationController
  expose(:raw_selected_tag) { Tag.where(title: tag_title).first }
  expose(:selected_tag) { raw_selected_tag.decorate if raw_selected_tag }
  expose(:tags) { Tag.all.decorate }
  expose(:tag_title) { params[:tag_title] }
  expose(:people) { Person.for_tag_title(tag_title).decorate }
  expose(:badger_mentors) { Person.mentors.decorate }
  expose(:distinguish_people) { Role.where(tag_id: 9) }
  expose(:distinguish_person) { Person.find(person_id) }

  def index
  end

  def mentors
  end

  # Showing distinguish people details
  def distinguish_badgers;end
  
end
