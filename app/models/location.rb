class Location < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3, maximum: 60},
                   uniqueness: { case_sensitive: false }

  has_many :sessions
end
