class AddGoalToAttempt < ActiveRecord::Migration[5.2]
  def change
    add_reference :attempts, :goal, foreign_key: true
  end
end
