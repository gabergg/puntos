class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @habit = current_user.habits.build
      @list_items = current_user.list
    end
  end

  def about
  end

  def contact
  end
end
