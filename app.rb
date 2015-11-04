require 'sinatra'
require 'sinatra/reloader'

# homepage
get '/' do
  erb :index
end

# List all apartments (hardcode into the erb file)
get '/apartments' do
  erb :aparmtments
end

# View a single aparments details
get '/apartments/:apartment_id' do
 erb :apartments
end

# Create a new apartment - should I use post?
# Route will show a form for adding a new apartment
# Form includes address, monthly_rent, sqft, num_beds, num_baths, renters
get 'aparmtments/new' do
  erb :apartments
end

# List all tenants for apartment 1
get '' do
  erb :tenants
end

# Create a new tenant (in apartment 1?)
# Route will show a form for adding a new tenant
# Form includes Name, Age, Gender
get '' do
  erb :tenants
end
