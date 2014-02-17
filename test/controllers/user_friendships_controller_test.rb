require 'test_helper'

class UserFriendshipsControllerTest < ActionController::TestCase
  
  context "#new" do
    
    context "not logged in" do
      should "redirect to the login page" do
        get :new
        assert_response :redirect
      end
    end

    context "logged in" do
      setup do
        sign_in users(:rob)
      end

      should "get new and return success" do
        get :new
        assert_response :success
      end

      should "should set a flash error if the friend_id is missing" do
        get :new, {}
        assert_equal "Friend Required", flash[:error]
      end

      should "display the friend's name" do
        get :new, friend_id: users(:mike).id
        assert_match /#{users(:mike).full_name}/, response.body
      end

      should "assign a new user friendship" do
        get :new, friend_id: users(:mike).id
        assert assigns(:user_friendship)
      end

      should "assign a new user friendship to the correct friend" do
        get :new, friend_id: users(:mike).id
        assert_equal users(:mike), assigns(:user_friendship).friend
      end

      should "assign the currently logged in user to new friendship" do
        get :new, friend_id: users(:mike).id
        assert_equal users(:rob), assigns(:user_friendship).user
      end

      should "show a 404 if friend can't be found" do
        get :new, friend_id: "invalid"
        assert_response :not_found
      end
    end
  end
end
