class PostsController < ApplicationController
  def index
    @posts = Post.order("created_at DESC").all
    @categories = Category.all
  end

  def show
    @post = Post.find( params[:id] )
    @post.content = add_images( @post.content )
  end

  def show_category
    @posts = Category.find( params[:category] ).posts.order("created_at DESC").all
    @category_name = Category.find( params[:category] ).name
    @categories = Category.all

    render "posts/index"
  end

  def work
    @post = Post.where("title = 'Work Experience'").first
    @post.content = add_images( @post.content )

    render "posts/show"
  end

  private
    def add_images( content )
      content.gsub( /\[IMG\s+(?<name>[^\]]+)\]/ ) do |m|
        image = PostImage.find_by( name: $1 )
        if image then
          "src=\"" + image.image_url.to_s + "\""
        end
      end
    end
    
end
