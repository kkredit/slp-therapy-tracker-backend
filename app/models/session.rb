class Session < ApplicationRecord
  validates :time, presence: true, uniqueness: true
  validates :provider_id, presence: true

  belongs_to :provider
  belongs_to :location
  has_many :students
end
