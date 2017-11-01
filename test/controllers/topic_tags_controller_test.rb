require 'test_helper'

class TopicTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @topic_tag = topic_tags(:one)
  end

  test "should get index" do
    get topic_tags_url, as: :json
    assert_response :success
  end

  test "should create topic_tag" do
    assert_difference('TopicTag.count') do
      post topic_tags_url, params: { topic_tag: { name: @topic_tag.name, topic_id: @topic_tag.topic_id } }, as: :json
    end

    assert_response 201
  end

  test "should show topic_tag" do
    get topic_tag_url(@topic_tag), as: :json
    assert_response :success
  end

  test "should update topic_tag" do
    patch topic_tag_url(@topic_tag), params: { topic_tag: { name: @topic_tag.name, topic_id: @topic_tag.topic_id } }, as: :json
    assert_response 200
  end

  test "should destroy topic_tag" do
    assert_difference('TopicTag.count', -1) do
      delete topic_tag_url(@topic_tag), as: :json
    end

    assert_response 204
  end
end
