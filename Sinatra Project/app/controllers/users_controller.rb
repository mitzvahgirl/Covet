class UsersController < ApplicationController
    get "/signup" do
        erb :'users/new'
    end

    post "/users" do
        puts "got hereee==>>   #{params}"
        @user = User.all.find_or_create_by(username: params[:username])
        if @user.password_hash == nil
            @user.password_hash = password
            @user.save
        else

        end
    end

end
