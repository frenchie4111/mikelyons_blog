class HomeController < ApplicationController
    def index
        @recent_posts = Post.last( 3 )
    end
end
