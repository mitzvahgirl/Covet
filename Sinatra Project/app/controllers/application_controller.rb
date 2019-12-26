class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "auth_demo_lv"
  end

  get '/' do
    # flash[:notice] = "Hooray, Flash is working!"
    erb :'home'
  end

  helpers do
    def logged_in?
      !!session[:username]
    end
  end
end
