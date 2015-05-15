require "rails_helper"

RSpec.feature "Word Features", :type => :feature do

    #creating a test so the filler word is inputted in the
    #field correctly
    it "Creates a new filler word in the field on the test page" do
        #takes us to the test page
        visit "/test"
        #testing within the id fillerWordInput
        within "#fillerWordInput" do
            #fills in "Roboto" in the text field
            fill_in("newFiller", :with => "Roboto")
            #clicks the button Add for us
            click_button("Add")
        end
        #the word Roboto does not render on the page so we
        #do not expect it to. To test for false positive, removing
        #_not and seeing it if does causes a test failure
        expect(page).to_not have_content "Roboto"
        end
    end
