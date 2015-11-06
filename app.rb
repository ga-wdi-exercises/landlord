require 'bundler/setup'

# Gems
require 'pg'
require 'active_record'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'

# load database
require_relative 'db/connection'

# load controllers
require_relative 'controllers/apartments_controller.rb'

# load models
require_relative 'models/apartment'
require_relative 'models/tenant'

# routes
get '/' do
  erb :home
end
