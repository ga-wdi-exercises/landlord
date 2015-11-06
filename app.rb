require 'sinatra'
require 'sinatra/reloader'
# require 'haml'
require 'pry'

require_relative 'db/connection.rb'

require_relative 'controllers/apartments'
require_relative 'controllers/tenants'

require_relative 'models/apartment'
require_relative 'models/tenant'


# Create instance variables that query

# The homepage should list several menu options:
  # List all apartments (a link to GET /apartments)
  # View an apartment's details(a link to GET /apartments/1)
  # Add an apartment(a link to GET /apartments/new)
  # List tenants (a link to GET /apartments/1/tenants)

get '/' do
  # @title = "Landlord App"
  erb :index
end

# not_found do
#   status 404
#   'not found'
# end
