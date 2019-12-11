require 'bundler/setup'
Bundler.require

require_relative '../app/models/show.rb'
require_relative '../app/controllers/application_controller.rb'
require_relative '../app/controllers/shows_controller.rb'

use Rack::MethodOverride
use Rack::Session::Cookie
use SessionsController
use PostsController
use UsersController
use CategoriesController
run ApplicationController