class Event < ActiveRecord::Base
  validates :starts_at, timeliness: true
  validates :title, presence: true

  default_scope { order('events.starts_at desc') }

  def self.published
    where(published: true)
  end
end
