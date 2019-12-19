class SessionsController < ApplicationController

    get '/login' do
        erb :"sessions/login"
    end

    post '/sessions' do
        session[:email] = params[:email]
        redirect '/posts'
    end

    get '/logout' do
        session.clear
        redirect '/login'
    end
end