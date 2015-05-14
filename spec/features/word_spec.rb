require "rails_helper"

RSpec.feature "Word Features", :type => :feature do

    it "Creates a new word on the page" do
        visit "/test"

        within "#fillerWordInput" do

            fill_in("newFiller", :with => "Roboto")
            click_button("Add")
        end
        expect(page).to_not have_content "Roboto"
        end
    end

