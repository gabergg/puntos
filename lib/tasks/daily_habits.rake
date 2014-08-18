task daily: :environment do
  User.all.each do |user|
    user.habits.each do |habit|
      DailyHabit.create(date: DateTime.now.tomorrow.to_date, user_id: user.id, habit_id: habit.id, completed: false)
    end
  end
end