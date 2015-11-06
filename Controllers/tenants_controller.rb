get "/tenants" do
  @tenants = Tenant.all
  erb :"tenants/tenants_index"
end
