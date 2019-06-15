class CreateReminderLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :reminder_logs do |t|
      t.date :last_done_at
    end
  end
end
