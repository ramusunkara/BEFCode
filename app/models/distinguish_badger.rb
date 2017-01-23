class DistinguishBadger < ActiveRecord::Base

	validates :first_name, presence: true
  validates :last_name, presence: true

  has_attached_file :photo, styles: { large: '300x300', medium: '200x200', thumb: '100x100' }
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
