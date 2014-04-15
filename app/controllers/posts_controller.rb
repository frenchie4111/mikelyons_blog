class PostsController < ApplicationController
  def index
    @posts = Post.all
    @categories = Category.all
  end

  def show
    @post = Post.find( params[:id] )
    @post.content = add_images( @post.content )
  end

  def show_category
    @posts = Category.find( params[:category] ).posts.all
    @categories = Category.all

    render "posts/index"
  end

  private
    def add_images( content )
      content.gsub( /\[IMG\s+(?<name>[^\]]+)\]/ ) do |m|
        image = PostImage.find_by( name: $1 )
        if image then
          "<img src=\"" + image.image_url.to_s + "\">"
        end
      end
    end
end
