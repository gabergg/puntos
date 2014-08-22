class DailyHabit < ActiveRecord::Base
  belongs_to :user
  belongs_to :habit

  validates :date, presence: true
  validates :user_id, presence: true
  validates :habit_id, presence: true

  def self.daily_list(user_id, date)
    DailyHabit.joins(:habit).select("daily_habits.*, habits.task").where(user_id: user_id, date: Date.strptime(date, '%m/%d/%Y'))
  end

  def self.generate_daily_habits

  end

end
