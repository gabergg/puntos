class DailyHabitsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: [:create, :destroy]

  def show
    @user = User.find(params[:id])
    @habits = @user.habits
  end

  def create
    @habit = current_user.daily_habits.build(params[:daily_habits].merge(habit_id: ))
    if @habit.save
      flash[:success] = "Habit created!"
      redirect_to root_url
    else
      @list_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @habit.destroy
    redirect_to root_url
  end

  private

  def habit_params
    params.require(:habit).permit(:task, :total_points)
  end

  def correct_user
    @habit = current_user.habits.find_by(id: params[:id])
    redirect_to root_url if @habit.nil?
  end
end