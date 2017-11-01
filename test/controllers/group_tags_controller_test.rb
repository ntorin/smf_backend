require 'test_helper'

class GroupTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_tag = group_tags(:one)
  end

  test "should get index" do
    get group_tags_url, as: :json
    assert_response :success
  end

  test "should create group_tag" do
    assert_difference('GroupTag.count') do
      post group_tags_url, params: { group_tag: { group_id: @group_tag.group_id, name: @group_tag.name } }, as: :json
    end

    assert_response 201
  end

  test "should show group_tag" do
    get group_tag_url(@group_tag), as: :json
    assert_response :success
  end

  test "should update group_tag" do
    patch group_tag_url(@group_tag), params: { group_tag: { group_id: @group_tag.group_id, name: @group_tag.name } }, as: :json
    assert_response 200
  end

  test "should destroy group_tag" do
    assert_difference('GroupTag.count', -1) do
      delete group_tag_url(@group_tag), as: :json
    end

    assert_response 204
  end
end
