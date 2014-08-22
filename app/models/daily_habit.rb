class DailyHabit < ActiveRecord::Base
  belongs_to :user
  belongs_to :habit

  validates :date, presence: true
  validates :user_id, presence: true
  validates :habit_id, presence: true

  def self.daily_list(user_id, date_in)
    date = date_in ? Date.strptime(date_in, '%m/%d/%Y') : Date.today
    DailyHabit.joins(:habit).select("daily_habits.*, habits.task").where(user_id: user_id, date: date)
  end

end
