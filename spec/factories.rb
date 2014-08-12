FactoryGirl.define do
  factory :user do
    name     "Gaber Example"
    email    "gaber@example.com"
    password "asdf1212"
    password_confirmation "asdf1212"
  end

  factory :habit do
    task "Lorem ipsum task"
    total_points 10
    user
  end



end
