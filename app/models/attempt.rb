class Attempt < ApplicationRecord
  enum status: [:correct, :incorrect, :correct_with_cueing]

  validates :number, presence: true, uniqueness: { scope: :goal_id },
                     numericality: { only_integer: true,
                                     greater_than_or_equal_to: 0,
                                     less_than_or_equal_to: 100 }
  validates :status, presence: true
  validates :goal_id, presence: true

  belongs_to :goal
end
