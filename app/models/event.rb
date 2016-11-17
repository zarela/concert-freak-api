class Event < ApplicationRecord

  has_many :interests
  has_many :users, through: :interests

  belongs_to :venue
end
