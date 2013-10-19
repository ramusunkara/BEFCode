class Event < ActiveRecord::Base
  validates :starts_at, timeliness: true
  validates :title, presence: true

  default_scope { order('events.starts_at desc') }

  def self.published
    where('publish_at is not null and publish_at <= ?', Time.now)
  end
end
