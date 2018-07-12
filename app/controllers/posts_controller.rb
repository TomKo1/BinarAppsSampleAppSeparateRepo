class PostsController < ApplicationController 
    def index 
        @posts = Post.all
    end

    def show 
         post_id = params[:id]
         @post = Post.find(post_id)
         @post_comments = Comment.where(post_id: post_id)
    end

    def new
        @post = Post.new
        @authors_list = Author.all.map{ |t| [t.name, t.id] }
    end

    def create 
        @post = Post.new(post_params)
        @authors_list = Author.all.map{ |t| [t.name, t.id] }

        if @post.save 
            # redirect_to pozostanie w kontekscie -> @author 
            redirect_to posts_path, notice: 'Post was created!'
        else
           render :new
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

    private

        def post_params
            params.require(:post).permit(:title, :content, :author_id)
        end
end