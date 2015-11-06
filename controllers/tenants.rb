get "/tenants" do
  @tenants = Tenant.all
  erb :tenant_index
end

get "/tenants/new" do
  erb :tenant_new
end

get "/tenants/search" do
  tenant = Tenant.find_by(name: params[:name])
  redirect "tenants/#{tenant.id}"
end

get "/tenants/:id" do
  @tenant = Tenant.find(params[:id])
  erb :tenant_detail
end

post "/tenants" do
  apartment_id = Apartment.find_by(address: params[:address]).id
  new_tenant = Tenant.create(name: params[:name], age: params[:age], gender: params[:gender], apartment_id: apartment_id)
  redirect "/tenants/#{new_tenant}"
end

delete "/tenants/:id" do
  Tenant.find(params[:id]).destroy
  redirect "/tenants"
end
