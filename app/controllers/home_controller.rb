class HomeController < ApplicationController
    def index
        @recent_posts = Post.order( created_at: :desc ).limit( 5 )

        @projects = Post.joins(:categories).where( "categories.id = 1" ).order( created_at: :desc ).limit( 5 ) # One should always be projects
    end
end
