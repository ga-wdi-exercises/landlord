# List tenants (a link to GET /apartments/1/tenants)
# The route GET /apartments/1/tenants should list all tenants for 1 apartment.

get '/apartments/:id/tenants' do
  @apartment = Apartment.find(params[:id])
  @tenants = @apartment.tenants
  erb :'tenants/index'
end

# The route GET /apartments/1/tenants/new should show a form for adding a new tenant.
# Make sure to get the appropriate input from the user to create your person as per schema
get '/apartments/:id/tenants/new' do
  @apartment = Apartment.find(params[:id])
  erb :'tenants/new'
end

post '/apartments/:id/tenants' do
  Tenant.create(params[:tenant])
  redirect "/apartments/#{params[:id]}/tenants"
end
