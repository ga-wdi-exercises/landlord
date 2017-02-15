require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection.rb'

# Load specific routes / controllers
# require_relative 'controllers/artists.rb'
# require_relative 'controllers/songs.rb'

# Load models
require_relative 'models/apartments'
require_relative 'models/tenants'

####################
#  General routes  #
####################

# get "/" do
#   erb :home
# end
