require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the db
require_relative 'db/connection.rb'

# Load sepcific routes / controllers
require_relative 'controllers/apartments.rb'
require_relative 'controllers/tenants.rb'

# Load models
require_relative 'models/apartment'
require_relative 'models/tenant'

##################
# General Routes #
##################

get '/' do
  erb :home
end
