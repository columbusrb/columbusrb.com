require 'test_helper'

class SpeakersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @speaker = speakers(:one)
    @meeting = Meeting.find_or_create_next_date
    sign_in admin_users(:admin)
  end

  test "should get index" do
    get admin_speakers_url

    assert_response :success
  end

  test "should get new" do
    get new_admin_speaker_url

    assert_response :success
  end

  test "should create speaker" do
    assert_difference('Speaker.count') do
      post admin_speakers_url, params: {
        speaker: { name: @speaker.name, title: @speaker.title, url: @speaker.url, meeting_id: @meeting.id }
      }
    end

    assert_redirected_to admin_speaker_path(Speaker.last)
  end

  test "should show speaker" do
    get admin_speaker_url(@speaker)

    assert_response :success
  end

  test "should get edit" do
    get edit_admin_speaker_url(@speaker)

    assert_response :success
  end

  test "should update speaker" do
    patch admin_speaker_url(@speaker), params: {
      speaker: { name: @speaker.name, title: @speaker.title, url: @speaker.url, meeting_id: @meeting.id }
    }

    assert_redirected_to admin_speaker_path(@speaker)
  end

  test "should destroy speaker" do
    assert_difference('Speaker.count', -1) do
      delete admin_speaker_url(@speaker)
    end

    assert_redirected_to admin_speakers_path
  end
end
