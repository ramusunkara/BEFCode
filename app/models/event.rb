class Event < ActiveRecord::Base
  validates :starts_at, timeliness: true
  validates :title, presence: true

  def self.published
    where('publish_at is not null and publish_at <= ?', Time.now)
  end
end
