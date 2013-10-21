class EventDecorator < Draper::Decorator
  delegate_all

  def full_address
    "#{venue_street_address} #{venue_city}, #{venue_state} #{venue_zip}"
  end
end
