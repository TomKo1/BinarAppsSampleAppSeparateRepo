require 'rails_helper'

RSpec.describe Comment, type: :model do 

    describe 'validation' do 
        it { should validate_presence_of(:content) }
    end

    describe 'relations' do 

        it  {  should have_many(:commentators) }
        it { should belong_to(:post) }

    end
end