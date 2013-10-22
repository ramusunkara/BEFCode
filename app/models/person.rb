class Person < ActiveRecord::Base
  has_many :roles
  has_many :tags, through: :roles

  accepts_nested_attributes_for :roles

  validates :first_name, presence: true
  validates :last_name, presence: true

  default_scope { order(:last_name) }

  def self.for_linkedin_url(url)
    profile = Linkedin::Profile.get_profile(url)
    if profile
      organization = profile.current_companies[0][:company] unless profile.current_companies.empty?
      new first_name: profile.first_name,
        last_name: profile.last_name,
        title: profile.title,
        organization: organization
    end
  end

  def update_from_linkedin
    person = Person.for_linkedin_url(linkedin_url)
    return false unless person

    attrs = person.attributes.keep_if do |key, value|
      linkedin_attributes.include? key
    end

    self.update_attributes(attrs)
  end

  def linkedin_attributes
    %w(first_name last_name title organization)
  end

  def self.mentors
    where(mentor: true)
  end

  def self.board_members
    where(board_member: true)
  end

  def self.for_tag_title(tag_title)
    return all unless tag_title.present?

    joins(:tags).where(tags: { title: tag_title })
  end
end