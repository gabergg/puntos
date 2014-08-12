namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_habits
  end
end

def make_users
  100.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@example.com"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_habits
  users = User.all(limit: 6)
  50.times do
    task = Faker::Lorem.sentence(5)
    total_points = Faker::Number.number(2)
    users.each { |user| user.habits.create!(task: task, total_points: total_points) }
  end
end