class Goal < ApplicationRecord
  validates :number, presence: true, uniqueness: { scope: :student_id },
                     numericality: { only_integer: true,
                                     greater_than_or_equal_to: 0,
                                     less_than_or_equal_to: 3 }
  validates :student_id, presence: true

  belongs_to :student
end
