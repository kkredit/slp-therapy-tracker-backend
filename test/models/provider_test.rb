require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  def setup
    @provider = Provider.create(username: 'testuser', fname: 'Sally', lname: 'Anderson',
                                email: 'sanderson@school.edu')
  end

  test "'provider' must be valid" do
    assert @provider.valid?
  end

  test "username must be present" do
    @provider.username = ""
    assert_not @provider.valid?
  end

  test "username must be unique" do
    @new_provider = Provider.create(username: 'testuser', fname: 'Sally', lname: 'Anderson',
                                    email: 'sanderson2@school.edu')
    assert_not @new_provider.valid?
  end

  test "username must be at least 5 characters" do
    @provider.username = "a" * 4
    assert_not @provider.valid?
    @provider.username = "a" * 5
    assert @provider.valid?
  end

  test "username must be at most 20 characters" do
    @provider.username = "a" * 20
    assert @provider.valid?
    @provider.username = "a" * 21
    assert_not @provider.valid?
  end

  test "fname must be present" do
    @provider.fname = ""
    assert_not @provider.valid?
  end

  test "fname must be at least 1 characters" do
    @provider.fname = "a" * 0
    assert_not @provider.valid?
    @provider.fname = "a" * 1
    assert @provider.valid?
  end

  test "fname must be at most 20 characters" do
    @provider.fname = "a" * 20
    assert @provider.valid?
    @provider.fname = "a" * 21
    assert_not @provider.valid?
  end

  test "lname must be present" do
    @provider.lname = ""
    assert_not @provider.valid?
  end

  test "lname must be at least 1 characters" do
    @provider.lname = "a" * 0
    assert_not @provider.valid?
    @provider.lname = "a" * 1
    assert @provider.valid?
  end

  test "lname must be at most 20 characters" do
    @provider.lname = "a" * 20
    assert @provider.valid?
    @provider.lname = "a" * 21
    assert_not @provider.valid?
  end

  test "email must be present" do
    @provider.email = ""
    assert_not @provider.valid?
  end

  test "email must be unique" do
    @new_provider = Provider.create(username: 'testuser2', fname: 'Sally', lname: 'Anderson',
                                    email: 'sanderson@school.edu')
    assert_not @new_provider.valid?
  end

  test "email must be at most 105 characters" do
    @provider.email = "a@a.a" + ("a" * 100)
    assert @provider.valid?
    @provider.email = "a@a.a" + ("a" * 101)
    assert_not @provider.valid?
  end

  test "email must be valid address" do
    @provider.email = "a"
    assert_not @provider.valid?
    @provider.email = "a@"
    assert_not @provider.valid?
    @provider.email = "a@a"
    assert_not @provider.valid?
    @provider.email = "a@a."
    assert_not @provider.valid?
    @provider.email = "a.a"
    assert_not @provider.valid?
    @provider.email = "a.a@"
    assert_not @provider.valid?
    @provider.email = "a.a@a"
    assert_not @provider.valid?
    @provider.email = "a@a.a"
    assert @provider.valid?
  end
end
