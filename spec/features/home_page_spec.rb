require 'rails_helper'

RSpec.describe "home page", :type => :feature do

#a very basic test to make sure the home page is rendering text in the html
  it "visits the home page" do
    #takes us to the main route page
    visit "/"
    #we expect the page to have the text in the h3 field, which it does
    #testing for false positive, if we include to_not it causes a test failure
    expect(page).to have_css "h3", text: "Use CleanSpeech to get rid of words from your vocabulary"
  end
end