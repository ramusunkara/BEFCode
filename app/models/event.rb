class Event < ActiveRecord::Base
  just_define_datetime_picker :starts_at

  validates :starts_at, timeliness: true
  validates :title, presence: true

  has_attached_file :photo,
    styles: { medium: "300x300>", thumb: "100x100>" }

  default_scope { order('events.starts_at desc') }

  def self.published
    where(published: true)
  end

  def self.past_events
    published.where('starts_at is not null and starts_at <= ?', Time.now)
  end

  def self.upcoming_events
    published.where('starts_at is not null and starts_at >= ?', Time.now).order('events.starts_at asc')
  end
end
