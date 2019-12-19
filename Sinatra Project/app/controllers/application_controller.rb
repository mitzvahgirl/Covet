class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "auth_demo_lv"
  end

  get '/' do
    erb :'home'
  end





  helpers do
  

  def logged_in?
    !!session[:email]
  end
 end
end
