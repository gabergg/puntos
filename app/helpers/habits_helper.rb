module HabitsHelper

  def habit_list
    Habit.where("user_id = ?", id)
  end

  def task_list

  end

  def daily_list(date)
    DailyHabit.joins('INNER JOIN habits ON habits.id = daily_habits.habit_id').where("daily_habits.user_id = ? AND daily_habits.date = ?", id, date)
  end

end


