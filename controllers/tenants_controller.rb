require "pry"

get "/tenants" do
  @tenants = Tenant.all
  @tenants.sort
  erb :"/tenants/index"

end
