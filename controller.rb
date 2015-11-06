get '/' do
  erb :home
end

get '/apartments' do
  @apartments=Apartment.all
  erb :"apartments/index"
end

get '/tenants' do
  @tenants=Tenant.all
  erb :"tenants/index"
end

get '/apartments/new' do
  @apartments=Apartment.all
  erb :"apartments/new"
end

get '/apartments/:id' do
  @id=params[:id].to_i
  @apartments=Apartment.all
  erb :"apartments/id"
end

get '/tenants/:id' do
  @id=params[:id].to_i
  @tenants=Tenant.all
  erb :"tenants/id"
end

get '/apartments/:id/tenants' do
  @id=params[:id].to_i-1
  @apartments=Apartment.all
  @tenants=Tenant.all
  erb :"apartments/id_tenants"
end

get '/apartments/:id/tenants/new' do
  erb :id_tenants_new
end
