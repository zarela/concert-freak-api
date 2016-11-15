class User < ApplicationRecord
  has_many :interests
  has_many :events, through: :interests

  validates :username, presence: true, uniqueness: true
  has_secure_password
end
