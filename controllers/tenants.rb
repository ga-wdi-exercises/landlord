# index
get '/apartments/:id/tenants' do
  @apartment = Apartment.find(params[:id])
  erb :"tenants/index"
end

# new
get '/apartments/:id/tenants/new' do
  @apartment = Apartment.find(params[:id])
  erb :"tenants/new"
end

# create
post '/apartments/:id/tenants' do
  apartment = Apartment.find(params[:id])
  apartment.tenants.create!(params[:apartment])
  redirect "/apartments/#{apartment.id}/tenants"
end
