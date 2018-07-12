require 'rails_helper'

# co testujemy
RSpec.describe Comment, type: :model do 
    describe 'validation' do 
        # it 'should have content present' do 
        #     Author.create(name: 'Tomek',surname: 'Kot', age: 25)
        #     author = Author.last
        #     Post.create(title: 'Tytul', content: 'Content ktory jest bardzo dlugi bo jeest dlugi',author_id: author.id)
        #     post = Post.last
            
        #     expect(Comment.new).not_to be_valid
        #     expect(Comment.new(post_id: post.id, content: 'Bardzo dlugi content ktory jest dlugi')).to be_valid
        # end
        
        it { should validate_presence_of(:content) }
    end
    describe 'relations' do 
        # it 'should have many-to-many association with commentators' do 
        #     t = Comment.reflect_on_association(:commentators)

        #     expect(t.macro).to eq(:has_many)
        # end
        it  {  should have_many(:commentators) }

        # it 'should belong to post' do 
        #     t = Comment.reflect_on_association(:post)
    
        #     expect(t.macro).to eq(:belongs_to)
        # end

        it { should belong_to(:post) }
    end

    # dokonczyc to 
    # describe '#give_fresh_comment' do 
    #         let(:author) { create(:author) }


    #     it 'should return authors fullname' do 
    #         #author = Author.new(name: 'test', surname: 'test213',age: 20)

    #         expect(author.fullname).to eq('Andrzej Tester')
    #     end

    # end

end