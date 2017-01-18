class PersonDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{first_name} #{last_name}"
  end

  def short_person_date
    model.created_at.strftime("%B %-d, %Y")
  end
end