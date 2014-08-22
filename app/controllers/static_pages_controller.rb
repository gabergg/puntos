class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @habit = current_user.habits.build
      @daily_items = DailyHabit.daily_list(current_user.id, session[:date])
    end
  end

  def about

  end

  def contact

  end
end
