require 'test_helper'

class AttemptTest < ActiveSupport::TestCase
  def setup
    # associate a attempt first
    @goal = Goal.first

    @attempt = Attempt.create(number: 0, goal_id: @goal.id, status: :correct)
  end

  test "'attempt' must be valid" do
    assert @attempt.valid?
  end

  test "number must be present" do
    @attempt.number = ""
    assert_not @attempt.valid?
  end

  test "number must be an integer" do
    @attempt.number = 0.5
    assert_not @attempt.valid?
  end

  test "number must be unique per goal id" do
    new_attempt = Attempt.create(number: @attempt.number, goal_id: @attempt.goal_id, status: :correct)
    assert_not new_attempt.valid?
    new_attempt = Attempt.create(number: @attempt.number, goal_id: Goal.last.id, status: :correct)
    assert new_attempt.valid?
  end

  test "number must be great than or equal to 0" do
    @attempt.number = -1
    assert_not @attempt.valid?
    @attempt.number = 0
    assert @attempt.valid?
  end

  test "number must be less than or equal to 100" do
    @attempt.number = 100
    assert @attempt.valid?
    @attempt.number = 101
    assert_not @attempt.valid?
  end

  test "status must not be invalid" do
    invalid_statuses = [-10, -1, 4, 10]
    invalid_statuses.each do |is|
      begin
        @attempt.status = is
        assert false, "#{is} should be invalid"
      rescue
        assert true
      end
    end
  end

  test "status must be valid" do
    valid_statuses = [:correct, :incorrect, :correct_with_cueing]
    valid_statuses.each do |is|
      begin
        @attempt.status = is
        assert @attempt.valid?
      rescue
        assert false,  "#{is} should be invalid"
      end
    end
  end
end
