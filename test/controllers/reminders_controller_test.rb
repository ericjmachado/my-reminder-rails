require "test_helper"

class RemindersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reminders_path
    assert_response :success
  end
  test "should get new" do
    get new_reminder_path
    assert_response :success
  end
  test "should create reminder" do
    assert_difference("Reminder.count") do
      post reminders_path, params: { reminder: { color: "#FFF000", observation: "", name: "Test", date: DateTime.now } }
    end
    assert_redirected_to reminders_path
  end

  test "should get edit" do
    get edit_reminder_path(reminders(:one))
    assert_response :success
  end

  test "should update reminder" do
    patch reminder_path(reminders(:one)), params: { reminder: { color: "#FFF000", observation: "", name: "Test update", date: DateTime.now } }
    assert_redirected_to reminders_path
  end

  test "should destroy reminder" do
    assert_difference("Reminder.count", -1) do
      delete reminder_path(reminders(:one))
    end
    assert_redirected_to reminders_path
  end
end
