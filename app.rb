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

#home page for apt
get "/apartments" do
  @apt = Apartment.all
  erb (:"apartments/index")
end

#show single apt
get '/apartments/:id' do
  erb (:"apartments/show")
end

#create new
get '/apartments/new' do
  erb (:"apartments/new")
end

get '/apartments/:id/tenants' do
  erb (:"tenants/index")
end
