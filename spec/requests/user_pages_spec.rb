require 'spec_helper'

describe 'User pages' do
  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end

  describe "habits page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:h1) { FactoryGirl.create(:habit, user: user, task: "Eat Food", total_points: 20) }
    let!(:h2) { FactoryGirl.create(:habit, user: user, task: "Drink drinks", total_points: 10) }

    before { visit user_path(user) }

    it { should have_content("Habits") }
    it { should have_title("Habits") }

    describe "habits" do
      it { should have_content(h1.task) }
      it { should have_content(h2.task) }
      it { should have_content(h1.total_points) }
      it { should have_content(h2.total_points) }
    end
  end

end