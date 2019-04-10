require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    @location = Location.create(name: 'testlocation')
  end

  test "'location' must be valid" do
    assert @location.valid?
  end

  test "name must be present" do
    @location.name = ""
    assert_not @location.valid?
  end

  test "name must be unique" do
    @new_location = Location.create(name: 'testlocation')
    assert_not @new_location.valid?
  end

  test "name must be at least 3 characters" do
    @location.name = "a" * 2
    assert_not @location.valid?
    @location.name = "a" * 3
    assert @location.valid?
  end

  test "name must be at most 60 characters" do
    @location.name = "a" * 60
    assert @location.valid?
    @location.name = "a" * 61
    assert_not @location.valid?
  end
end
