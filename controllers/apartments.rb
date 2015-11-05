get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/new' do
  erb :"apartments/new"
end

get "/apartments/:id/edit" do
  @id = params[:id]
  @apartment = Apartment.find(@id)
  erb :"apartments/edit"
end

get "/apartments/:id/remove" do
  @id = params[:id]
  @apartment = Apartment.find(@id)
  erb :"apartments/remove"
end

get '/apartments/:id' do
  @id = params[:id]
  @apartment = Apartment.find(@id)
  @tenants = @apartment.tenants
  erb :"apartments/info"
end

get '/apartments/:id/tenants' do
  @id = params[:id]
  @apartment = Apartment.find(@id)
  @tenants = @apartment.tenants
  erb:"tenants/info"
end

get '/apartments/:id/tenants/new' do
  @id = params[:id]
  @apartment = Apartment.find(@id)
  erb:"tenants/new"
end

post '/apartments' do
  address = params[:address]
  beds = params[:num_beds]
  baths = params[:num_baths]
  rent = params[:monthly_rent]
  Apartment.create(address:address,num_beds:beds,num_baths:baths,monthly_rent:rent)
  redirect '/apartments'
end

put '/apartments/:id' do
  id = params[:id]
  address = params[:address]
  beds = params[:num_beds]
  baths = params[:num_baths]
  rent = params[:monthly_rent]
  apartment = Apartment.find(id)
  apartment.update(address:address,num_beds:beds,num_baths:baths,monthly_rent:rent)
  redirect "/apartments/#{id}"
end

delete '/apartments/:id' do
  id = params[:id]
  apartment = Apartment.find(id)
  apartment.destroy
  redirect "/apartments"
end
