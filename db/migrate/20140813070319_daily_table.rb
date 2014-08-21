class DailyTable < ActiveRecord::Migration
  def change

    create_table :'daily_habits.rake' do |t|
      t.date :date
      t.integer :user_id
      t.integer :habit_id
      t.boolean :completed, :default => false
    end

    add_index :'daily_habits.rake', [:user_id, :date, :completed]
  end
end