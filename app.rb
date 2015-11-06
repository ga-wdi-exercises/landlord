require "sinatra"
require "sinatra/reloader"
require "active_record"
require "pry"

require_relative "db/connection"

require_relative "models/apartment"
require_relative "models/tenant"

require "bundler/setup"
require "pg"




# require_relative 'controllers/welcome'
# require_relative 'controllers/apartments'
# require_relative 'controllers/tenants'


get '/' do
  erb :home
end

get '/apartments' do
  @apartments = Apartment.all
  erb :index
end

get '/apartments/new' do

  erb :new
end

get '/apartments/:id' do
  params[:id]
  erb :show
end

get '/apartments/:id/tenants' do
  params[:id]
  @tenants = Tenant.all
  erb :tenants
end





# The route GET /apartments/new should show a form for adding a new apartment
# Make sure to get the appropriate input from the user when creating an apartment as per schema
# The route GET /apartments/1 should show info about a single apartment
  # Tell the user the address, monthly_rent, sqft, num_beds, num_baths, and renters
# The route GET /apartments/1/tenants should list all tenants for 1 apartment.
# Make sure to get the appropriate input from the user to create your person as per schema
