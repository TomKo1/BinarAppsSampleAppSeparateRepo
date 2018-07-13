class AuthorsController < ApplicationController 
    
    # modified CRUD -> we can both create and display all authors
    def index 
        @authors = Author.paginate(:per_page => 5, :page => params[:page])
        @author = Author.new
    end

    def show 
         @author = Author.find(params[:id])
    end

    def create 
        @author = Author.new(author_params)
        @author.save
    end

    def edit
        @author = Author.find(params[:id])
    end

    def update 
        @author = Author.find(params[:id])
        if @author.update(author_params) 
            redirect_to authors_path, notice: 'Author was updated!'
        else
           render :edit
        end
    end

    def destroy 
        @author = Author.find(params[:id])        
        @author.destroy
    end

    private

        def author_params
            params.require(:author).permit(:name, :surname, :age)
        end
end