class CommentsController < ApplicationController 

    def new
       @comment = Comment.new
       # ??? 
       @post_id = params[:post_id]
    end

    def create 
        @comment = Comment.new(comment_params)
        
        if @comment.save 
            redirect_to posts_path, notice: 'You commented successfully!'
        else
           render :new
        end
    end

    private 
        def comment_params
            params.require(:comment).permit(:content, :post_id)
        end

end