class HabitCategory < ActiveRecord::Migration
  def change
    add_column :habits, :category, :string
    add_index  :habits, :category
  end
end
