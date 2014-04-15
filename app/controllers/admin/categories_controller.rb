class Admin::CategoriesController < Admin::ApplicationController
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
        @categories = Category.all
    end

    def edit
        @category = Category.find( params[:id] )
        @categories = Category.all
    end

    def create
        new_category = Category.new( params[:category].permit( :name ) )
        new_category.save()

        AdminAction.create( title: "Created Category", description: "Created Category " + new_category.id.to_s + " with name: " + params[:category][:name] )

        redirect_to "/admin/categories#index"
    end

    def update
        category = Category.find( params[:id] )

        category.update_attributes(params[:category].permit( :name ) )

        AdminAction.create( title: "Updated Category", description: "Updated Category " + params[:id] + " to name: " + params[:category][:name] )

        respond_to do |format|
            format.js
        end
    end

    def destroy
        @id = params[:id]
        Category.find(params[:id]).destroy()

        AdminAction.create( title: "Deleted Category", description: "Deleted Category " + params[:id] )

        respond_to do |format|
            format.js
        end
    end
end
