require 'rails_helper'

# co testujemy
RSpec.describe Author, type: :model do 

    # powinnismy grupowac razem testy 
    describe 'validations' do 
        
        # it 'should require name, surname and age' do 
           # expect(Author.new).not_to be_valid
            # expect(Author.new(name: 'test')).not_to be_valid
            # expect(Author.new(name: 'test', surname: 'test',age: 25)).to be_valid
        # end

        it { should validate_presence_of(:name)}
        it { should validate_presence_of(:surname)}

        it { should validate_length_of(:name).is_at_least(3).is_at_most(20) } 
           
        it { should validate_length_of(:surname).is_at_most(30) }
              
        it { should validate_inclusion_of(:age).in_range(1..150)  }
    end


    describe 'attributes' do 
        # pojedynczy test
        # it 'should have proper attributes' do 
        #     expect(Author.new.attributes).to include('name','surname','age')
        # end

        # todo: dodac
    end
    
    
    
    describe 'scope' do 
        # tak jakby setup 
        let(:author1) { create(:author, age: 15) }
        let(:author2) { Author.create(name: 'test',surname: 'test',age: 55) }

        

        it 'should have old scope' do
            # author1 = Author.create(name: 'test', surname: 'test', age: 15)
            # author2 = Author.create(name: 'test',surname: 'test',age: 55)
            
            expect(Author.old).to include(author2)
            expect(Author.old).not_to include(author1)
        end

        it 'should have young scope' do 
            expect(Author.young).to include(author1)
            expect(Author.young).not_to include(author2)
        end

    end
    describe 'callbacks' do 
        # let! -> nie bedzie przypisywanie lazy tylko od razu -> bo nie bedzie failowac
        # najlepiej tego nie wywolywac przed kazdym 

#        let (:author1) { Author.create(name: 'test', surname: 'test') }
        # napisywanie z factory bota
        let(:author1) { create(:author, age: nil) }
        it 'should set age to 25 if none was given' do 
            # author1 = Author.create(name: 'test', surname: 'test')
            
            expect(author1.age).to eq(25)
        end
    end

    describe 'relations' do 
        # testowanie relacji 
        # it 'should have many post' do 
        #     t = Author.reflect_on_association(:posts)

        #     expect(t.macro).to eq(:has_many)
        # end

        it  {  should have_many(:posts) }
    end   

    describe '#fullname' do 
        #create(:author) 
        #build(:author) # author new dodaje parametry z factory
        #let(:author) { Author.new(name: 'test', surname: 'test213',age: 20) }
        let(:author) { create(:author) }
        it 'should return authors fullname' do 
            #author = Author.new(name: 'test', surname: 'test213',age: 20)

            expect(author.fullname).to eq("#{author.name} #{author.surname}")
        end
    end


end