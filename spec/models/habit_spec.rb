require 'spec_helper'

describe Habit do

  let(:user) { FactoryGirl.create(:user) }
  before { @habit = user.habits.build(task: "Lorem Ipsum Task", total_points: 10) }

  subject { @habit }

  it { should respond_to(:task) }
  it { should respond_to(:user_id) }
  it { should respond_to(:total_points) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when task is not present" do
    before { @habit.task = nil }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @habit.user_id = nil }
    it { should_not be_valid }
  end

  describe "when total_points is not present" do
    before { @habit.total_points = nil }
    it { should_not be_valid }
  end

  describe "when total_points is negative" do
    before { @habit.total_points = -1 }
    it { should_not be_valid }
  end

end
