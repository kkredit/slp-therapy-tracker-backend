class Student < ApplicationRecord
  validates :number, presence: true, uniqueness: { scope: :session_id },
                     numericality: { only_integer: true,
                                     greater_than_or_equal_to: 0,
                                     less_than_or_equal_to: 3 }
  validates :session_id, presence: true

  belongs_to :session
end
