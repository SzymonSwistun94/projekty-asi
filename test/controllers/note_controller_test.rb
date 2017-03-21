require 'test_helper'

class NoteControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get note_create_url
    assert_response :success
  end

  test "should get edit" do
    get note_edit_url
    assert_response :success
  end

  test "should get remove" do
    get note_remove_url
    assert_response :success
  end

end
