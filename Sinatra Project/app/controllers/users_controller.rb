class UsersController < ApplicationController
    get "/signup" do
        erb :'users/new'
    end

    post "/" do
        erb :'users/new'
    end

end
