require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase

  should belong_to(:user)
  should belong_to(:friend)

  test "creating a friendship works without raising an exception" do
    assert_nothing_raised do
      UserFriendship.create user_id: users(:rob).id, friend_id: users(:mike).id
    end
  end
end
