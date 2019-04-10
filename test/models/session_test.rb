require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  def setup
    @provider = Provider.first
    @location = Location.first
    @session = Session.create(time: '2019-04-09 19:55:20', provider_id: @provider.id,
                              location_id: @location.id)
  end

  test "'session' must be valid" do
    assert @session.valid?
  end

  test "time must be present" do
    @session.time = ""
    assert_not @session.valid?
  end

  test "provider_id must be present" do
    @session.provider_id = ""
    assert_not @session.valid?
  end

  test "provider_id must be valid" do
    @session.provider_id = -1
    assert_not @session.valid?
  end
end
