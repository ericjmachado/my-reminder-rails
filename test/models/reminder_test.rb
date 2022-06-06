require "test_helper"

class ReminderTest < ActiveSupport::TestCase
  test "valid reminder" do
    reminder = Reminder.new(name: "Test", date: DateTime.now, color: "#FFF000")
    assert reminder.valid?
  end
  test "invalid color" do
    reminder =  Reminder.new(name: "Test invalid color", date: DateTime.now, color: "#G00000")
    assert_not_nil reminder.errors[:color], "is invalid"
  end
  test "invalid name" do
    reminder =  Reminder.new(date: DateTime.now, color: "#000000")
    assert_not_nil reminder.errors[:name], "can't be blank"
  end

  test "invalid date" do
    reminder =  Reminder.new(name: "Invalid date", color: "#000000")
    assert_not_nil reminder.errors[:name], "can't be blank"
  end

  test "empty color" do
    reminder =  Reminder.new(name: "Blank color", date: DateTime.now)
    assert_not_nil reminder.errors[:color], "can't be blank"
  end
end
