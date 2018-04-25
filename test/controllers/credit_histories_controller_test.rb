require 'test_helper'

class CreditHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit_history = credit_histories(:one)
  end

  test "should get index" do
    get credit_histories_url, as: :json
    assert_response :success
  end

  test "should create credit_history" do
    assert_difference('CreditHistory.count') do
      post credit_histories_url, params: { credit_history: { description: @credit_history.description, credit_transaction: @credit_history.credit_transaction, user_id: @credit_history.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show credit_history" do
    get credit_history_url(@credit_history), as: :json
    assert_response :success
  end

  test "should update credit_history" do
    patch credit_history_url(@credit_history), params: { credit_history: { description: @credit_history.description, credit_transaction: @credit_history.credit_transaction, user_id: @credit_history.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy credit_history" do
    assert_difference('CreditHistory.count', -1) do
      delete credit_history_url(@credit_history), as: :json
    end

    assert_response 204
  end
end
