#ffaker gem to produce data 
require 'ffaker'

#factory girl to create a word in the factory 
FactoryGirl.define do

    factory :speech_attempt do |f|
        #
        f.speech_name { FFaker::Name.name }
        # f.time { FFaker::Time.date }
        #only produces 0, doesn't seem to have a ffaker 
        #method to produce what I want for a stopwatch
    end
end
