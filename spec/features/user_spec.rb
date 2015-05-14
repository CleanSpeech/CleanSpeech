require 'rails_helper'
# require 'spec_helper'

RSpec.describe "User Features", :type => :feature do

  it "does a basic sign up routing" do
    visit "/users/sign_up"
    expect(current_path).to eq(new_user_registration_path)
  end

   it "displays the user's email after successful sign in" do
    @user = FactoryGirl.build(:user, :email => "jdoe@example.com", :password => "secretsecret")
    visit "/users/sign_up"
    visit "form.sign_in" do
        fill_in "Email", :with => "jdoe@example.com"
        fill_in "Password", :with => "secretsecret"
    
    click_button "Sign Up"

    expect(page).to have_selector(".header .email", :text => "jdoe@example.com")
    end
  end

  it "tries to sign in with incorrect password" do 
    @user = FactoryGirl.build(:user, :email => "jdoe@example.com", :password => "secretsecret")
    visit "/users/sign_up"
    visit "form.sign_in" do
        fill_in "Email", :with => "jdoe@example.com"
        fill_in "Password", :with => "secretsecretigotasecret"
    
    click_button "Sign Up"

    expect(page).to be_invalid
    end
  end

end 




