class EventDecorator < Draper::Decorator
  delegate_all

  def starts_at
    # TODO: Extract into a named format
    model.starts_at.strftime("%A %B %-d, %Y %-l:%M %P")
  end

  def full_address
    "#{venue_street_address} #{venue_city}, #{venue_state} #{venue_zip}"
  end
end
