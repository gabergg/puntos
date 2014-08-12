class DefaultComplete < ActiveRecord::Migration
  def change
    change_column :habits, :complete, :boolean, :default => false
  end
end
