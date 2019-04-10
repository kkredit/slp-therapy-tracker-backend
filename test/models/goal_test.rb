require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  def setup
    # associate a goal first
    @student = Student.first

    @goal = Goal.create(number: 0, student_id: @student.id)
  end

  test "'goal' must be valid" do
    assert @goal.valid?
  end

  test "number must be present" do
    @goal.number = ""
    assert_not @goal.valid?
  end

  test "number must be an integer" do
    @goal.number = 0.5
    assert_not @goal.valid?
  end

  test "number must be unique per student id" do
    new_goal = Goal.create(number: @goal.number, student_id: @goal.student_id)
    assert_not new_goal.valid?
    new_goal = Goal.create(number: @goal.number, student_id: Student.last.id)
    assert new_goal.valid?
  end

  test "number must be great than or equal to 0" do
    @goal.number = -1
    assert_not @goal.valid?
    @goal.number = 0
    assert @goal.valid?
  end

  test "number must be less than or equal to 3" do
    @goal.number = 3
    assert @goal.valid?
    @goal.number = 4
    assert_not @goal.valid?
  end
end
