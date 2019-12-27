require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash
  
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
    def current_user
      User.find_by(username: session[:username])
    end
  end
end
