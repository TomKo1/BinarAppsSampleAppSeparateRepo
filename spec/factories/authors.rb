FactoryBot.define do 
    factory :author do 
        name { Faker::Name.male_first_name } 
        surname { Faker::Name.last_name }
        age 32
    end
    # remember (docs): Each factory has a name and a set of attributes.
    # The name is used to guess the class of the object by default, 
    # but it's possible to explicitly specify it   :((((
    factory :author2, class: Author do 
        name 'Tomek'
        surname 'Kot'
        age 50
    end 
end