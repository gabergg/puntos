require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }
    it { should have_content('Free Puntos') }
    it { should have_title(full_title('')) }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:habit, user: user, task: "Lorem ipsum", total_points: 10)
        FactoryGirl.create(:habit, user: user, task: "Dolor sit amet", total_points: 20)
        sign_in user
        visit root_path
      end

      it "should render the user's list" do
        user.list.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.task)
        end
      end
    end
  end

  describe "About page" do
    before { visit about_path }
    it { should have_content('About') }
    it { should have_title(full_title('About')) }
  end

  describe "Contact page" do
    before { visit contact_path }
    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }
  end
end