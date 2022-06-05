class Reminder < ApplicationRecord
  validates :name, :color, :date, presence: true
  validates_format_of :color, with: /\A#?(?:[A-F\d]{3}){1,2}\z/i
end
