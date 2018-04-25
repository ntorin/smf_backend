require 'test_helper'

class AnonymousProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anonymous_profile = anonymous_profiles(:one)
  end

  test "should get index" do
    get anonymous_profiles_url, as: :json
    assert_response :success
  end

  test "should create anonymous_profile" do
    assert_difference('AnonymousProfile.count') do
      post anonymous_profiles_url, params: { anonymous_profile: { name: @anonymous_profile.name, name_color: @anonymous_profile.name_color, user_id: @anonymous_profile.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show anonymous_profile" do
    get anonymous_profile_url(@anonymous_profile), as: :json
    assert_response :success
  end

  test "should update anonymous_profile" do
    patch anonymous_profile_url(@anonymous_profile), params: { anonymous_profile: { name: @anonymous_profile.name, name_color: @anonymous_profile.name_color, user_id: @anonymous_profile.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy anonymous_profile" do
    assert_difference('AnonymousProfile.count', -1) do
      delete anonymous_profile_url(@anonymous_profile), as: :json
    end

    assert_response 204
  end
end
