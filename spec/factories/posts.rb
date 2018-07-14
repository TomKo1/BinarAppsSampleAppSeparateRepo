FactoryBot.define do 
    factory :post do 
        content 'even more interesting content'
        title 'Title'
        author
    end

    factory :post2, class: Post do 
        content 'very interesting content'   
        title 'Very Interesting Title'     
        author
    end
end