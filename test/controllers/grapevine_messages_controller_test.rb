require 'test_helper'

class GrapevineMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grapevine_message = grapevine_messages(:one)
  end

  test "should get index" do
    get grapevine_messages_url, as: :json
    assert_response :success
  end

  test "should create grapevine_message" do
    assert_difference('GrapevineMessage.count') do
      post grapevine_messages_url, params: { grapevine_message: { group_id: @grapevine_message.group_id, is_anonymous: @grapevine_message.is_anonymous, message: @grapevine_message.message, name: @grapevine_message.name, user_id: @grapevine_message.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show grapevine_message" do
    get grapevine_message_url(@grapevine_message), as: :json
    assert_response :success
  end

  test "should update grapevine_message" do
    patch grapevine_message_url(@grapevine_message), params: { grapevine_message: { group_id: @grapevine_message.group_id, is_anonymous: @grapevine_message.is_anonymous, message: @grapevine_message.message, name: @grapevine_message.name, user_id: @grapevine_message.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy grapevine_message" do
    assert_difference('GrapevineMessage.count', -1) do
      delete grapevine_message_url(@grapevine_message), as: :json
    end

    assert_response 204
  end
end
