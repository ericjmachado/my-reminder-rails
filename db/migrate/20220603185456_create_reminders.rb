class CreateReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.string :color, limit: 7
      t.text :observation, null: true
      t.string :name, limit: 30
      t.datetime :date
      t.timestamps
    end
  end
end
