require 'rails_helper'


RSpec.describe Author, type: :model do 

    # test all validations
    describe 'validations' do 
    
        it { should validate_presence_of(:name)}
        it { should validate_presence_of(:surname)}

        it { should validate_length_of(:name).is_at_least(3).is_at_most(20) } 
           
        it { should validate_length_of(:surname).is_at_most(30) }
              
        it { should validate_inclusion_of(:age).in_range(1..150) }

    end

    # test all scopes
    describe 'scope' do 
        # tak jakby setup 
        let(:author_young) { create(:author, age: 15) }
        let(:author_old) { create(:author2) }
        

        it 'should have old scope' do
            expect(Author.old).to include(author_old)
            expect(Author.old).not_to include(author_young)
        end

        it 'should have young scope' do 
            expect(Author.young).to include(author_young)
            expect(Author.young).not_to include(author_old)
        end

    end
    

    # tests model relations
    describe 'relations' do 
         
        it  {  should have_many(:posts).dependent(:destroy) }

    end   

    describe '#fullname' do 
        let(:author) { create(:author) }
        
        it 'should return authors fullname' do 
            expect(author.fullname).to eq("#{author.name} #{author.surname}")
        end

    end

    
    
    
    describe 'callbacks' do 
        let(:author1) { create(:author, age: nil) }

        it 'should set age to 25 if none was given' do 
            expect(author1.age).to eq(25)
        end

    end

    describe 'attributes' do 
        it 'should have proper attributes' do 
            expect(Author.new.attributes).to include('name','surname','age')
        end
    end

end