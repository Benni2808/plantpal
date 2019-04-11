class ReminderLog < ApplicationRecord
    def self.done_for_today
        already_done = false
        ReminderLog.transaction do
            already_done = exists?(last_done_at: Date.today)
            if ! already_done
                create!(last_done_at: Date.today)
            end
        end
        return already_done
    end
end
