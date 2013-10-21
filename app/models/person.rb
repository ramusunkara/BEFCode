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
      new first_name: profile.first_name,
        last_name: profile.last_name,
        title: profile.title,
        organization: profile.current_companies[0][:company]
    end
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