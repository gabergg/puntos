class DailyHabit < ActiveRecord::Base
  belongs_to :user
  belongs_to :habit

=begin
  validates :date, presence: true
  validates :user_id, presence: true
  validates :habit_id, presence: true
  validates :completed, presence: true
=end

end
