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
  @new_tenant = Tenant.create(name: params[:name], age: params[:age], gender: params[:gender])
  redirect '/tenants/' + @new_tenant.id.to_s
end

get "/tenants/:tenant_id" do
  @tenants = Tenant.all
  @tenant_id = params[:tenant_id]
  @tenant_details = Tenant.find(@tenant_id)
  erb :"tenants/show"
end

# Edit tenant details
get "/tenants/:tenant_id/edit" do
  @tenants = Tenant.all
  @tenant_id = params[:tenant_id]
  @tenant_details = Tenant.find(@tenant_id)
  erb :"tenants/edit"
end
