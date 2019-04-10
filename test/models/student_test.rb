require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  def setup
    # associate a session first
    @session = Session.first

    @student = Student.create(number: 0, session_id: @session.id)
  end

  test "'student' must be valid" do
    assert @student.valid?
  end

  test "number must be present" do
    @student.number = ""
    assert_not @student.valid?
  end

  test "number must be an integer" do
    @student.number = 0.5
    assert_not @student.valid?
  end

  test "number must be unique per session id" do
    new_student = Student.create(number: @student.number, session_id: @student.session_id)
    assert_not new_student.valid?
    new_student = Student.create(number: @student.number, session_id: Session.last.id)
    assert new_student.valid?
  end

  test "number must be great than or equal to 0" do
    @student.number = -1
    assert_not @student.valid?
    @student.number = 0
    assert @student.valid?
  end

  test "number must be less than or equal to 3" do
    @student.number = 3
    assert @student.valid?
    @student.number = 4
    assert_not @student.valid?
  end
end
