class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @habit = current_user.habits.build
      @daily_habit = current_user.daily_list(Date.current).first
    end
  end

  def about
  end

  def contact
  end
end
