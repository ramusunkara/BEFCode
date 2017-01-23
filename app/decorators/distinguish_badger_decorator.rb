class DistinguishBadgerDecorator < Draper::Decorator
  delegate_all

  def full_name
  	"#{first_name}#{last_name}"
  end

  def start_date
  	date.strftime('%B %-d, %Y')
  end

  def linkedin_url
  	h.link_to 'View Linkedin URL', distinguish_badger.linkedin_url, target: '_blank'
  end

  def philanthropy_url
  	h.link_to 'View Philanthropy URL', distinguish_badger.philanthropy_url, target: '_blank'
  end
end