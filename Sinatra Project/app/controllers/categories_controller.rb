class CategoriesController < ApplicationController
    get '/categories/new' do
        erb :"categories/new"
    end   

    post '/categories' do
        puts "categories here #{params}"
        category = Category.new(name: params[:name])
        if category.save!
            redirect '/categories'
        else
            redirect "/categories/new"
        end
    end

    get '/categories' do
        @categories = Category.all 
        erb :"categories/index"
        #puts "list of categories==>>>>>  #{@categories.inspect}"
    end
end

