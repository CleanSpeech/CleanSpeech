#ffaker gem to produce data 
require 'ffaker'

#factory girl to create a word in the factory 
FactoryGirl.define do
    
    # # Define a basic devise user.
    factory :word do |f| 
        #HipsterIpsum is the proper call to produce a
        #random word 
        f.word { FFaker::HipsterIpsum.word }
    end
end

