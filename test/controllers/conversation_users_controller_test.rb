require 'test_helper'

class ConversationUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conversation_user = conversation_users(:one)
  end

  test "should get index" do
    get conversation_users_url, as: :json
    assert_response :success
  end

  test "should create conversation_user" do
    assert_difference('ConversationUser.count') do
      post conversation_users_url, params: { conversation_user: { conversation_id: @conversation_user.conversation_id, user_id: @conversation_user.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show conversation_user" do
    get conversation_user_url(@conversation_user), as: :json
    assert_response :success
  end

  test "should update conversation_user" do
    patch conversation_user_url(@conversation_user), params: { conversation_user: { conversation_id: @conversation_user.conversation_id, user_id: @conversation_user.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy conversation_user" do
    assert_difference('ConversationUser.count', -1) do
      delete conversation_user_url(@conversation_user), as: :json
    end

    assert_response 204
  end
end
