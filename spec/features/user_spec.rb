require 'rails_helper'
# require 'spec_helper'

RSpec.describe "User Features", :type => :feature do

  #basic test for the user sign up
  it "does a basic sign up routing" do
    #takes us to the user sign up route
    visit "/users/sign_up"
    #expect the route to give us the new user registration path
    #testing for false positive, to_not results in a test failure
    expect(current_path).to eq(new_user_registration_path)
  end

  #testing for successful user sign in on the page
  it "displays the user's email after successful sign in" do
    #building a factory with specified email and password for FactoryGirl
    @user = FactoryGirl.create(:user, :email => "jdoe@example.com", :password => "secretsecret")
    #takes us to the main route page
    visit "/users/sign_up"
    #takes us to the sign in form
    visit "form.sign_in" do
        #inputs an email for the email information
        fill_in "Email", :with => "jdoe@example.com"
        #inputs password information for the password information
        fill_in "Password", :with => "secretsecret"
    #clicks the button to sign up for us
    click_button "Sign Up"

    #expecting the page to have the email rendered with the text below
    expect(page).to have_selector("Email", :text => "jdoe@example.com")
    end
  end

  #basically same test as above but testing for incorrect password to reject the sign in
  it "tries to sign in with incorrect password" do 
    @user = FactoryGirl.create(:user, :email => "jdoe@example.com", :password => "secretsecret")
    visit "/users/sign_up"
    visit "form.sign_in" do
        fill_in "Email", :with => "jdoe@example.com"
        fill_in "Password", :with => "secretsecretigotasecret"
    
    click_button "Sign Up"

    expect(page).to be_invalid
    end
  end
end 




