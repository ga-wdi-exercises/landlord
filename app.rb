require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

# The homepage should list several menu options
# List all apartments (a link to GET /apartments)
get '/apartments' do
# The route GET /apartments should list all apartments
  # these apartments will just be hardcoded in your app.rb or in your erb file.
  erb :apartment_index
end

# Add an apartment(a link to GET /apartments/new)
get '/apartments/new' do
# The route GET /apartments/new should show a form for adding a new apartment
  # Make sure to get the appropriate input from the user when creating an apartment as per schema
  erb :apartment_new
end

# View an apartment's details(a link to GET /apartments/1)
get '/apartments/:id' do
# The route GET /apartments/1 should show info about a single apartment
  # Tell the user the address, monthly_rent, sqft, num_beds, num_baths, and renters
  erb :apartment_id
end

# List tenants (a link to GET /apartments/1/tenants)
get '/apartments/:id/tenants' do
# The route GET /apartments/1/tenants should list all tenants for 1 apartment.
  erb :tenants_index
end

get '/apartments/:id/tenants/new' do
# The route GET /apartments/1/tenants/new should show a form for adding a new tenant.
  # Make sure to get the appropriate input from the user to create your person as per schema
  erb :tenant_new
end
