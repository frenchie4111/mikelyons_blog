class Admin::PostsController < Admin::ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def edit
        @post = Post.find( params[:id] )
    end

    def create
        new_post = Post.new( params[:post].permit( :title, :subject, :content ) )
        new_post.save()

        redirect_to "/admin/posts#index"
    end

    def update
        Post.find( params[:id] ).update_attributes(params[:post].permit( :title, :subject, :content ) )

        AdminAction.create( title: "Updated Post", description: "Updated Post " + params[:id] = " to content: " + params[:post][:content] )

        respond_to do |format|
            format.js
        end
    end

    def destroy
        @id = params[:id]
        Post.find(params[:id]).destroy()

        respond_to do |format|
            format.js
        end
    end
end
