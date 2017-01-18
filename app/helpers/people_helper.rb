module PeopleHelper
	def person person_id
		@person = Person.find(person_id)
	end

	def short_person_date date
		date.strftime("%B %-d, %Y")
	end
end