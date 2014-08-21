class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @habit = current_user.habits.build
      #@daily_habit = current_user.daily_list(Date.current).first
      #@daily_items = DailyHabit.joins(:habit).select("daily_habits.*, habits.task").where(user_id: current_user.id, date: Date.strptime(params[:date], '%m/%d/%Y'))
      @daily_items = DailyHabit.daily_list(current_user.id, session[:date])
      flash[:notice] = @daily_items.length
    end
  end

  def about

  end

  def contact

  end
end
