get '/' do
  erb :home
end

get '/tenants' do
  @tenants = Tenant.all
  erb :"tenants/index"
end
