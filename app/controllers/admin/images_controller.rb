class Admin::ImagesController < Admin::ApplicationController
    def index
        @images = PostImage.all
    end

    def new
        @image = PostImage.new
    end

    def create
        PostImage.create( params[:post_image].permit(:name, :image) )

        redirect_to "/admin/images#index"
    end

    def destroy
        @id = params[:id]
        PostImage.find(params[:id]).destroy()

        respond_to do |format|
            format.js
        end
    end
end
