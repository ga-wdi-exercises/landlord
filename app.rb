require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'

# Load the file to connect to the DB
require_relative 'db/connection.rb'

# Load specific routes / controllers
require_relative 'controllers/apartments.rb'

# Load models
require_relative 'models/apartment'
require_relative 'models/tenant'

#  General routes  #
get "/" do
  erb :home
end

get "/tenants" do
  @tenants = Tenant.all
  erb :tenants
end

# get "/:paramsTest" do
#   "#{params[:paramsTest]} PARAMS hello ww"
# end
