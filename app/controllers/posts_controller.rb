class PostsController < ApplicationController
  def index
    @posts = Post.all
    @categories = Category.all
  end

  def show
    @post = Post.find( params[:id] )
  end

  def show_category
    @posts = Category.find( params[:category] ).posts.all
    @categories = Category.all

    render "posts/index"
  end
end
