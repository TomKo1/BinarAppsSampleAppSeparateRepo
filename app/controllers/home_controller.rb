class HomeController < ApplicationController
    
    # this controller perhaps should do anything with Post -> we have posts controller
    def welcome 
        @top_posts = Post.ten_latest

    end

end