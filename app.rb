require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection.rb'

# Load specific routes / controllers
require_relative 'controllers/apartments.rb'
require_relative 'controllers/tenants.rb'

# Load models
require_relative 'models/apartments'
require_relative 'models/tenants'

####################
#  General routes  #
####################

get "/" do
  erb :"index"
end
