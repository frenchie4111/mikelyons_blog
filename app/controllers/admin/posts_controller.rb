class Admin::PostsController < Admin::ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
        @categories = Category.all
    end

    def edit
        @post = Post.find( params[:id] )
        @categories = Category.all
    end

    def create
        new_post = Post.new( params[:post].permit( :title, :subject, :content ) )
        new_post.save()

        params[:post][:category_ids].each do |id|
            if( id != "" )
                new_post.categories << Category.find( id )
            end
        end

        redirect_to "/admin/posts#index"
    end

    def update
        post = Post.find( params[:id] )

        post.update_attributes(params[:post].permit( :title, :subject, :content ) )

        post.categories.clear
        params[:post][:category_ids].each do |id|
            if( id != "" )
                post.categories << Category.find( id )
            end
        end

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
