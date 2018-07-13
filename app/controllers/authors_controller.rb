class AuthorsController < ApplicationController 
    
    def index 
        @authors = Author.all
        @author = Author.new
    end

    def show 
         @author = Author.find(params[:id])
    end

    def new
        @author = Author.new
    end

    def create 
        @author = Author.new(author_params)
        # if @author.save 
        #     # redirect_to pozostanie w kontekscie -> @author 
        #     redirect_to authors_path, notice: 'Author was created!'
        # else
        #    render :new
        # end
        # nie interesuje nas czy sie zapisal czy nie 
        @author.save
    end

    def edit
        @author = Author.find(params[:id])
    end

    def update 
        @author = Author.find(params[:id])
        if @author.update(author_params) 
            # redirect_to pozostanie w kontekscie -> @author 
            redirect_to authors_path, notice: 'Author was updated!'
        else
           render :edit
        end
    end

    def destroy 
        @author = Author.find(params[:id])        
        @author.destroy
        #redirect_to authors_path, alert: 'Author was destroyed!'
    end

    private

        def author_params
            params.require(:author).permit(:name, :surname, :age)
        end
end