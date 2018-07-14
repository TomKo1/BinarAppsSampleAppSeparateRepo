require 'rails_helper'

RSpec.describe AuthorPost, type: :model do 

    describe 'relations' do 

        it { should belong_to(:author) }
        it { should belong_to(:post) }

    end
end