class StaticPagesController < ApplicationController
  def home
    @habit = current_user.habits.build if signed_in?
  end

  def about
  end

  def contact
  end
end
