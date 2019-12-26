class UsersController < ApplicationController
    get "/signup" do
        erb :'users/new'
    end

    post "/signup" do
        if params[:password] == params[:password_confirmation]
            user = User.find_by(username: params[:username])
            if user && user.authenticate(params[:password])
                session[:username] = params[:username]
                redirect '/inventories'
            else
                new_user = User.new(name: params[:name], username: params[:username], password: params[:password])
                if new_user.save!
                    session[:username] = params[:username]
                    redirect '/inventories'
                else
                    erb :'users/new'
                end
            end
        else
            @error = 'Passwords not matching'
            erb :'users/new'
        end
    end

end
