require "pry"

get "/tenants" do
  @tenants = Tenant.all
  @tenants.sort
  erb :"/tenants/index"

end

get "/tenants/:id" do
  @tenant = Tenant.find(params[:id])
  erb :"/tenants/tenant_template"
end

get "/tenants/edit/:id" do
  @tenant = Tenant.find(params[:id])
  erb :"/tenants/edit"
end

put "/tenants/:id" do
  @tenant = Tenant.find(params[:id])
  @tenant.update(name: params[:name], gender: params[:gender], age: params[:age])
  redirect "/tenants/#{@tenant.id}"
end

delete "/tenants/:id" do
  Tenant.find(params[:id]).destroy
  redirect "/tenants"
end
