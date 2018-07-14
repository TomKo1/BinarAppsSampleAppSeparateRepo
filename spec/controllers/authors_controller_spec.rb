require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do 

    # useful for testing as AuthorsController doesn't use all CRUD actions
    describe 'template rendering' do 
        # under testing
        let(:author_ut) { create(:author2) }
        
        it 'renders the index template' do 
            get :index
            expect(response).to render_template('index')
        end

        it 'renders the show template' do 
            get :show, params: { id: author_ut.id }
            expect(response).to render_template('show')
        end

        it 'renders the edit template' do 
            get :edit, params: {id: author_ut.id }
            expect(response).to render_template('edit')
        end
    end

     # tests for pagination
     describe 'index page should use pagination' do 
        
        


     end


     # how to test ajax ?????
     describe 'creation of new author' do 
        
        # TODO: end this
        it 'should create author using ajax' do
            # dane na stale to moze byc slaby pomysl
            expect { 
                post :create, xhr: true, :params => { :author => { name: 'John', surname: 'Kovalsky', age: 32 } } 
            }.to change { Author.count }
            #expect(response).to render_template(:partial => 'author')
            #expect(index).to have_selector('tr.th', count: 1)
        end

        it 'ajax should display alert if author was not valid while saving' do 
            # how to check for alert presence?
            expect { 
                post :create, xhr: true, :params => { :author => { surname: 'Kovalsky', age: 32 } } 
            }.not_to change { Author.count }
        end
    end 

    describe 'destroy author' do
        let!(:author_to_destroy) { create(:author) }

        it 'should destroy author' do 
            expect{   
                 delete :destroy,xhr: true ,:params => { id: author_to_destroy.id }
            }.to change { Author.count}
        end

    end


end