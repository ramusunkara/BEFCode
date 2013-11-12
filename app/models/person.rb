class Person < ActiveRecord::Base
  has_many :roles
  has_many :tags, through: :roles

  accepts_nested_attributes_for :roles

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_attached_file :photo, styles: { large: '300x300', medium: '200x200', thumb: '100x100' }

  default_scope { order(:last_name) }

  def display_name
    decorate.full_name
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
