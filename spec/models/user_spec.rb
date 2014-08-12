require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Gaber Example", email: "gaber@example.com",
                     password: "asdf1212", password_confirmation: "asdf1212")
  end

  subject { @user }

  it { should respond_to(:habits) }

  describe "micropost associations" do

    before { @user.save }
    let!(:habit_fewer_points) do
      FactoryGirl.create(:habit, task: "Lorem Ipsum task", user: @user, total_points: 10)
    end
    let!(:habit_more_points) do
      FactoryGirl.create(:habit, task: "Lorem Ipsum task", user: @user, total_points: 20)
    end

    it "should have the habits in the right order" do
      expect(@user.habits.to_a).to eq [habit_more_points, habit_fewer_points]
    end

    it "should destroy associated habits" do
      habits = @user.habits.to_a
      @user.destroy
      expect(habits).not_to be_empty
      habits.each do |habit|
        expect(Habit.where(id: habit.id)).to be_empty
      end
    end
  end

end