class User < ActiveRecord::Base
  has_many :habits, dependent: :destroy
  has_many :daily_habits, dependent: :destroy

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  #Note that presence validation for password and password_confirmation are added by has_secure_password

  has_secure_password

  def habit_list
    Habit.where("user_id = ?", id)
  end

  def task_list

  end

  def daily_list(date)
    DailyHabit.joins('INNER JOIN habits ON habits.id = daily_habits.habit_id').where("daily_habits.user_id = ? AND daily_habits.date = ?", id, date)
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
end
