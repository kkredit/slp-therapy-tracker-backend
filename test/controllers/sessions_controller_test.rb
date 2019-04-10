require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # associate a provider first
    @provider = Provider.first
    @session = sessions(:one)
    @session.provider_id = @provider.id
  end

  teardown do
    delete provider_url(@provider)
  end

  test "should get index" do
    get sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_session_url
    assert_response :success
  end

  test "should create session" do
    # must delete session before creating, so that the final number changes
    # required because sessions have unique times, so a repeated create will fail
    delete session_url(@session)

    assert_difference('Session.count') do
      post sessions_url, params: { session: { time: @session.time, provider_id: @session.provider_id } }
    end

    assert_redirected_to session_url(Session.last)
  end

  test "should show session" do
    get session_url(@session)
    assert_response :success
  end

  test "should get edit" do
    get edit_session_url(@session)
    assert_response :success
  end

  test "should update session" do
    patch session_url(@session), params: { session: { time: @session.time, provider_id: @session.provider_id } }
    assert_redirected_to session_url(@session)
  end

  test "should destroy session" do
    assert_difference('Session.count', -1) do
      delete session_url(@session)
    end

    assert_redirected_to sessions_url
  end
end
