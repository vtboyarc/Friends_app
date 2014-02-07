require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:rob).profile_name
    assert_response :success
    assert_template "profiles/show"
  end

  test "should show not found if user not found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

  test "variables should be assigned on successful viewing" do
    get :show, id: users(:rob).profile_name
    assert assigns(:user)
    assert_not_empty assigns(:statuses)
  end
end
