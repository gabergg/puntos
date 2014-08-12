require 'spec_helper'

describe "HabitPages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "habit creation" do
    before do
      visit root_path
      #click_button "New Habit"
    end

    describe "with invalid information" do

      it "should not create a micropost" do
        expect { click_button "Add" }.not_to change(Habit, :count)
      end

      describe "error messages" do
        before { click_button "Add" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before do
        fill_in 'habit_task', with: "Lorem ipsum"
        fill_in 'habit_total_points', with: 20
      end
      it "should create a new habit" do
        expect { click_button "Add" }.to change(Habit, :count).by(1)
      end
    end
  end

end
