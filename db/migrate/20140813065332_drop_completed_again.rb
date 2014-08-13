class DropCompletedAgain < ActiveRecord::Migration
  def change
    remove_column :habits, :completed_points
    remove_column :habits, :complete
  end
end
