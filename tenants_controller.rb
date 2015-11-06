
get "/tenants" do
  # binding.pry
  @tenants = Tenant.all
  erb :"tenants/index"
end
