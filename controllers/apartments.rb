get '/' do
  erb :home
end

get '/apartments' do
  @apartments= Apartment.all
  erb :'apartments/index'
end

get '/apartments/new' do
  erb :'apartments/new'
end

post '/apartments' do
@new_apartment = Apartment.create(address: params[:address])
redirect "apartments"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @tenants = Tenant.where(apartment_id: params[:id])
  erb :'apartments/show'
end
