#show all tenants
get "/tenants" do
  @tenants = Tenant.all
  erb :"tenants/index"
end

#display Tenant info when clicked
get "/tenants/:id" do
  @tenants = Tenant.find_by(id: params[:id].to_i)
  erb :"tenants/show"
end
