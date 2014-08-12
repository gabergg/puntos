class Habit < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('total_points DESC') }
  validates :task, presence: true
  validates :user_id, presence: true
  validates :total_points, presence: true, :numericality => { :greater_than_or_equal_to => 0 }


end
