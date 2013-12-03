class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  just_define_datetime_picker :starts_at

  validates :starts_at, presence: true
  validates :title, presence: true

  has_attached_file :photo, styles: { huge: '1200x600#', large: '600x300#', medium: '300x200#', thumb: '100x66#' }

  default_scope { order('events.starts_at desc') }

  def self.next_or_last
    if upcoming_events.any?
      upcoming_events.first
    else
      past_events.first
    end
  end

  def self.published
    where(published: true)
  end

  def self.past_events
    published.where('starts_at is not null and starts_at <= ?', Time.now)
  end

  def self.upcoming_events
    published.where('starts_at is not null and starts_at >= ?', Time.now).order('events.starts_at asc')
  end

  def self.without(event)
    return self unless event
    where('id != :id', id: event.id)
  end

  def past?
    starts_at.past?
  end

  def truncate_desc(max_sentences = 3, max_words = 50)
    # Take first 3 setences
    three_sentences = description.gsub(/&.*;/,'').scan(/[^\.!?]+[\.!?]/).map(&:strip)[0..max_sentences-1].join(' ')
    # Take first 50 words of the above
    three_sentences.split(' ').slice(0, max_words).join(' ')
  end

end
