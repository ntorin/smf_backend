require 'test_helper'

class ConversationMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conversation_message = conversation_messages(:one)
    @user = User.create(email: 'test@citrume.com', password: 'Ilovefruits6', password_confirmation: 'Ilovefruits6')
  end

  test "should get index" do
    get conversation_messages_url, as: :json
    assert_response :success
  end

  test "should create conversation_message" do
    assert_difference('ConversationMessage.count') do
      post conversation_messages_url, params: { conversation_message: { conversation_id: @conversation_message.conversation_id, message: @conversation_message.message, user_id: @conversation_message.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show conversation_message" do
    get conversation_message_url(@conversation_message), as: :json
    assert_response :success
  end

  test "should update conversation_message" do
    patch conversation_message_url(@conversation_message), params: { conversation_message: { conversation_id: @conversation_message.conversation_id, message: @conversation_message.message, user_id: @conversation_message.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy conversation_message" do
    assert_difference('ConversationMessage.count', -1) do
      delete conversation_message_url(@conversation_message), as: :json
    end

    assert_response 204
  end
end
