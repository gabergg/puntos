class CreateHabits < ActiveRecord::Migration
  def change
    create_table :habits do |t|
      t.string :task
      t.integer :user_id
      t.integer :total_points
      t.integer :completed_points
      t.boolean :complete

      t.timestamps
    end
    add_index :habits, [:user_id, :created_at, :complete]
  end
end
