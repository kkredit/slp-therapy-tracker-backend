class AddStudentToGoal < ActiveRecord::Migration[5.2]
  def change
    add_reference :goals, :student, foreign_key: true
  end
end
