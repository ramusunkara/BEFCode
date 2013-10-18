class Tag < ActiveRecord::Base
  has_many :roles
  has_many :people, through: :roles

  validates :title, presence: true, uniqueness: true
end