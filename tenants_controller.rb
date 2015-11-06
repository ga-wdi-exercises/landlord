
get "/tenants" do
  # binding.pry
  @tenants = Tenant.all
  erb :"tenants/index"
end

# not sure yet what i'm going to do with this page since form lives on layout
get "/new" do
  erb :"tenants/new"
end

# this listens for creation in form and posts to tenants page
post '/tenants' do
  Tenant.create(name: params[:new_tenant], age: params[:new_tenant_age] , gender: params[:new_tenant_gender])
  redirect "/tenants"
end
