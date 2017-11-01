require 'test_helper'

class FriendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friend = friends(:one)
  end

  test "should get index" do
    get friends_url, as: :json
    assert_response :success
  end

  test "should create friend" do
    assert_difference('Friend.count') do
      post friends_url, params: { friend: { friend_one: @friend.friend_one, friend_two: @friend.friend_two } }, as: :json
    end

    assert_response 201
  end

  test "should show friend" do
    get friend_url(@friend), as: :json
    assert_response :success
  end

  test "should update friend" do
    patch friend_url(@friend), params: { friend: { friend_one: @friend.friend_one, friend_two: @friend.friend_two } }, as: :json
    assert_response 200
  end

  test "should destroy friend" do
    assert_difference('Friend.count', -1) do
      delete friend_url(@friend), as: :json
    end

    assert_response 204
  end
end
