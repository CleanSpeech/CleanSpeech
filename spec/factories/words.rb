#ffaker gem to produce data 
require 'ffaker'

#factory girl to create a word in the factory 
FactoryGirl.define do
    
    # # Define a basic devise user.
    factory :word do |f| 
        #string is the proper call to produce just
        #a string for the word 
        f.word { FFaker::HipsterIpsum.word }
    end
end

# FactoryGirl.define do
#   factory :blah do
#     name "dummy"
#     alias "dummy"
#   end
# end