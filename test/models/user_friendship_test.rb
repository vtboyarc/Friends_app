require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase

  should belong_to(:user)
  should belong_to(:friend)

  test "creating a friendship works without raising an exception" do
    assert_nothing_raised do
      UserFriendship.create user: users(:rob), friend: users(:mike)
    end
  end
end
