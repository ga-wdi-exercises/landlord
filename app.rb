require 'sinatra'
require 'sinatra/reloader'


get '/' do
  erb :index
end

# - The homepage should list several menu options:
#   * List all apartments (a link to `GET /apartments`)


get '/apartments' do
  @apartments = Apartment.all
  erb :"apartment/index"
end

#   * View an apartment's details(a link to `GET /apartments/1`)
get 'apartments/:id' do
  erb :apartment_details
end
#   * Add an apartment(a link to `GET /apartments/new`)
get 'apartments/new' do
  erb :new_apartment
end
#   * List tenants (a link to `GET /apartments/1/tenants`)
get '/apartments/:id/tenants' do
  erb :tenants
end

# - The route `GET /apartments` should list all apartments
#   * these apartments will just be hardcoded in your `app.rb` or in your `erb` file.


# - The route `GET /apartments/new` should show a form for adding a new apartment
#   * Make sure to get the appropriate input from the user when creating an apartment as per schema
get '/apartments/new' do
  erb :new_apartment
end
# - The route `GET /apartments/1` should show info about a single apartment
#   * Tell the user the address, monthly_rent, sqft, num_beds, num_baths, and renters
get '/apartments/:id' do
  erb :apartment_details
end


# - The route `GET /apartments/1/tenants` should list all tenants for 1 apartment.
get 'apartments/:id' do
  erb :apartment_details
end

# - The route `GET /apartments/1/tenants/new` should show a form for adding a new tenant.
#   * Make sure to get the appropriate input from the user to create your person as per schema
get '/apartments/:id/tenants/new'
  erb :new_tenant
end
