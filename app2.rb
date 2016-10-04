require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require "active_record"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"


#
# The homepage should list several menu options:
# List all apartments (a link to GET /apartments)
# View an apartment's details(a link to GET /apartments/1)
# Add an apartment(a link to GET /apartments/new)
# List tenants (a link to GET /apartments/1/tenants)
# The route GET /apartments should list all apartments
# these apartments will just be hardcoded in your app.rb or in your erb file.
# The route GET /apartments/new should show a form for adding a new apartment
# Make sure to get the appropriate input from the user when creating an apartment as per schema
# The route GET /apartments/1 should show info about a single apartment
# Tell the user the address, monthly_rent, sqft, num_beds, num_baths, and renters
# The route GET /apartments/1/tenants should list all tenants for 1 apartment.
# The route GET /apartments/1/tenants/new should show a form for adding a new tenant.
# Make sure to get the appropriate input from the user to create your person as per schema

# this was done before I learned how in class on 10/4
get '/' do #Does the test pass
 "<br >
     1. List all apartments<br>
     2. List apartment details <br>
     3. Add an apartment<br>
     4. List Tenants<br>
 <form>
   Enter Menu Option:
   <input type='text' name='fmenu'><br>
</form>"
end
get "/apartments" do
  # 1. Get all the apartments
  @apartments=Apartment.all
  # 2. Render the instructs
  erb :"apartment/index"
end

get '/apartments/1' do
  Apartment.find_each do |apt|
    sprintf( ' %-10s  %-30s  $%8.2f\n',apt.id,apt.address,apt.monthly_rent)
  end # do
   puts
end

get "/apartments/:id" do
    @apartments= Apartment.find(params[:id])
    @address=@apartments.address
    @rent=@apartments.monthly_rent
    @sqft=@apartments.sqft
    @num_beds=@apartments.num_beds
    @num_baths=@apartments.num_baths

  erb :"apartment/show"
end
