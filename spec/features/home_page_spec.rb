require 'rails_helper'

RSpec.describe "home page", :type => :feature do

#a very basic test to make sure the home page is rendering text in the html
  it "visits the home page" do
    visit "/"
    expect(page).to have_css "h3", text: "Use CleanSpeech to get rid of words from your vocabulary"
  end

end