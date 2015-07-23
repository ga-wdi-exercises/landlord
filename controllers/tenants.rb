# index
get '/apartments/:id/tenants' do
  @apartment = Apartment.find(params[:id])
  erb :"tenants/index"
end

# show
get '/apartments/:id/tenants/new' do
  erb :"tenants/new"
end
