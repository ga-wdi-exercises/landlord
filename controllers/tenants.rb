
get '/tenants' do
  @tenants = Tenant.all
  erb :"tenants/index"
end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/person"
end

get "/tenants/:id/remove" do
  @id = params[:id]
  @tenant = Tenant.find(@id)
  erb :"tenants/remove"
end

delete '/tenants/:id' do
  id = params[:id]
  apartment = Tenant.find(id)
  apartment.destroy
  redirect "/tenants"
end

post '/apartments/:id/tenants' do
  name = params[:name]
  gender = params[:gender]
  age = params[:age]
  apartment_id = params[:id]
  Tenant.create(name:name,gender:gender,age:age,apartment_id:apartment_id)
  redirect "/apartments/#{apartment_id}/tenants"
end
