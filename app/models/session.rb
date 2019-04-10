class Session < ApplicationRecord
  validates :time, presence: true, uniqueness: true
  validates :provider_id, presence: true

  belongs_to :provider
end
