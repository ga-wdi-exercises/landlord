# List all apartments (hardcode into the erb file)
get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

# Create a new apartment - should I use post?
# Route will show a form for adding a new apartment
# Form includes address, monthly_rent, sqft, num_beds, num_baths, renters
# this has to come before id
get '/apartments/new' do
  erb :"apartments/new"
end

# # View a single apartment's details
get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/show"
end

# # Create a new tenant (in apartment 1?)
# # Route will show a form for adding a new tenant
# # Form includes Name, Age, Gender
# get '/apartments/:id/tenants/new' do
#
#   erb :"tenants/new"
# end
#
# # List all tenants for apartment
# get '/apartments/:id/tenants' do
#   erb :"tenants/index"
# end
