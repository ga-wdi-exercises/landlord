require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'

# Load the file to connect to the DB
require_relative 'db/connection.rb'

# Load models
require_relative 'models/apartment'
require_relative 'models/tenant'
require_relative 'controllers/apartments_controller.rb'


#  General routes  #
get "/" do
  erb :home
end
