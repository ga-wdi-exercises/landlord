# Show all tenants
get "/tenants" do
  @tenants = Tenant.all
  erb :"tenants/index"
end

# Add Tenant
get "/tenants/new" do
  erb :"tenants/new"
end

# Post new tenant form
post '/tenants' do
  apt = Apartment.find_by(address: params[:apt])
  new_tenant = Tenant.create(name: params[:name], age: params[:age], gender: params[:gender], apartment_id: apt.id)
  redirect '/tenants/' + new_tenant.id.to_s
end


# Delete Tenant
delete "/tenants/:tenant_id" do
  Tenant.destroy(params[:tenant_id])
  redirect "/tenants"
end

# Show tenant
get "/tenants/:tenant_id" do
  @tenant_details = Tenant.find(params[:tenant_id])
  erb :"tenants/show"
end

# Edit tenant details
get "/tenants/:tenant_id/edit" do
  @tenant_details = Tenant.find(params[:tenant_id])
  erb :"tenants/edit"
end

# Submit tenant edits to db
patch "/tenants/:tenant_id/edit" do
  tenant = Tenant.find(params[:tenant_id])
  apt = Apartment.find_by(address: params[:apt])
  tenant.update(name: params[:name], age: params[:age], gender: params[:gender], apartment_id: apt.id)
  redirect "/tenants/" + tenant.id.to_s
end
