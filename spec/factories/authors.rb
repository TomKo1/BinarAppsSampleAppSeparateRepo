FactoryBot.define do 
    factory :author do 
        name { Faker::Name.male_first_name } 
        surname { Faker::Name.last_name }
        age 32
    end
end