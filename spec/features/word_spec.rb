require "rails_helper"

RSpec.feature "Word Features", :type => :feature do

#save for when the routes are set up
    # it "User creates a new word" do
    #     visit "words/new"

    #     fill_in "Word", :with => "Snarglebargle"
    #     click_button "Create Word"

    #     expect(page).to have_selector(".word", )
    # end
end


# # example(s) for when I create a words spec that will test that a word was created
# RSpec.feature "Widget management", :type => :feature do
#   scenario "User creates a new widget" do
#     visit "/widgets/new"

#     fill_in "Name", :with => "My Widget"
#     click_button "Create Widget"

#     expect(page).to have_text("Widget was successfully created.")
#   end
# end

# # spec/features/widget_management_spec.rb
# feature "widget management" do
#   scenario "creating a new widget" do
#     visit root_url
#     click_link "New Widget"

#     fill_in "Name", with: "Awesome Widget"
#     click_button "Create Widget"

#     expect(page).to have_text("Widget was successfully created.")
#   end
# end