class Person < ActiveRecord::Base
  has_many :roles
  has_many :tags, through: :roles

  accepts_nested_attributes_for :roles

  validates :first_name, presence: true
  validates :last_name, presence: true

  default_scope { order(:last_name) }

  def self.for_tag_title(tag_title)
    return all unless tag_title.present?

    joins(:tags).where(tags: { title: tag_title })
  end
end