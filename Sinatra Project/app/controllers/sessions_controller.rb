class SessionsController < ApplicationController
    get '/login' do
        erb :"sessions/login"
    end

    post '/sessions' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:username] = params[:username]
            flash.now[:success] = "Signin success"
            redirect '/categories'
        else
            flash.now[:error] = "Error in signin"
            redirect '/login'
        end
    end

    get '/logout' do
        session.clear
        redirect '/login'
    end
end