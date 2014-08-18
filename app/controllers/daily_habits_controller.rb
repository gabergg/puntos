class DailyHabitsController < ApplicationController
  #before_action :signed_in_user, only: [:create, :destroy]
  #before_action :correct_user,   only: [:create, :destroy]

  def show
    @user = User.find(params[:id])
    @daily_habits = @user.daily_habits
  end

  def create
    @daily_habit = current_user.daily_habits.build(daily_habit_params)
    if @daily_habit.save
      flash[:success] = "Habit created!"
      redirect_to root_url
    else
      @list_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @daily_habit.destroy
  end

  private

  def daily_habit_params
    params.require(:daily_habit)
  end

  def correct_user
    @daily_habit = current_user.daily_habits.find_by(id: params[:id])
    redirect_to root_url if @habit.nil?
  end
end