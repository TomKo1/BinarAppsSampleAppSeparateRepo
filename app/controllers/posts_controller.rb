class PostsController < ApplicationController 
     
    # modified CRUD -> we can both create and display all authors
    def index 
        @posts = Post.paginate(:per_page => 5, :page => params[:page])
        @post = Post.new
        @authors_list = Author.all.map{ |t| [t.name, t.id] }
    end

    def show 
         post_id = params[:id]
         @post = Post.find(post_id)
         @post_comments = Comment.where(post_id: post_id)
    end

    def new
    end

    def create 
        @post = Post.new(post_params)
        authors_list = Author.all.map{ |t| [t.name, t.id] }

        if @post.save 
            # redirect_to pozostanie w kontekscie -> @author 
            redirect_to posts_path, notice: 'Post was created!'
        else
            #TODO: fix this -> this is temporary
            #flash[:alert] = 'Form cotains errors'
            redirect_to posts_path, alert: 'Form contains errors'
        end
    end

    def edit
        @post = Post.find(params[:id])
        @authors_list = Author.all.map{ |t| [t.name, t.id] }
    end

    def update 
        @post = Post.find(params[:id])
        @authors_list = Author.all.map{ |t| [t.name, t.id] }

        if @post.update(post_params) 
            # redirect_to pozostanie w kontekscie -> @author 
            redirect_to posts_path, notice: 'Post was updated!'
        else
           render :edit
        end
    end

    def destroy 
        @post = Post.find(params[:id])        
        @post.destroy
        redirect_to posts_path, alert: 'Post was destroyed!'
    end

    # action for searching engine in navbar
    def search_posts
        query = params[:lookup]
        if query.blank? != true 
            @results = Post.where('title LIKE ? OR content like ?', "%#{query}%","%#{query}%") 
        else
           redirect_to root_path, alert: 'Searching query should not be blank!'
        end
    end


    private

        def post_params
            params.require(:post).permit(:title, :content, :author_id)
        end
end