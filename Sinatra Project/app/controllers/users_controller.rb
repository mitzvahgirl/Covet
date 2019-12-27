class UsersController < ApplicationController
    get "/signup" do
        erb :'users/new'
    end

    post "/signup" do
        if params[:password] == params[:password_confirmation]
            new_user = User.new(name: params[:name], username: params[:username], password: params[:password])
            if new_user.save
                session[:username] = params[:username]
                flash.now[:success] = "User registration success!"
                redirect '/categories'
            else
                @errors = new_user.errors
                flash.now[:error] = "Error in signup"
                erb :'users/new'
            end
        else
            flash.now[:error] = "Passwords not same"
            erb :'users/new'
        end
    end

end
