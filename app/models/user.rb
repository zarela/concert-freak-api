class User < ApplicationRecord
  # has_many :rsvps, dependent: :destroy
  has_many :rsvps
  has_many :events, through: :rsvp

  validates :username, presence: true, uniqueness: true
  has_secure_password
end
