class User < ApplicationRecord
  has_many :interests, dependent: :destroy
  has_many :events, through: :interests

  validates :username, presence: true, uniqueness: true
  has_secure_password
end
