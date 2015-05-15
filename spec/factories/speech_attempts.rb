#ffaker gem to produce data 
require 'ffaker'

#factory girl to create a word in the factory 
FactoryGirl.define do

    factory :speech_attempt do |f|
        
        f.speech_name { FFaker::Name.name }
    end
end
