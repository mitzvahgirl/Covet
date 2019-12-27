class CategoriesController < ApplicationController
    get '/categories' do
        @categories = Category.all 
        erb :"categories/index"
    end
    
    get '/categories/new' do
        erb :"categories/new"
    end   

    post '/categories' do
        category = Category.new(name: params[:name])
        if category.save
            flash.now[:success] = "category created!"
            redirect '/categories'
        else
            @errors = category.errors
            flash.now[:error] = "Error creating category"
            redirect "/categories/new"
        end
    end

    get '/categories/:id' do
        @category = Category.find(params[:id])
        erb :"categories/show"
    end
end

