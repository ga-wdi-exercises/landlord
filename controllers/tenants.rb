get '/tenants' do
  @tenant = Tenant.all
  erb :'tenants/index'
end

get '/tenants/new' do
  erb :'tenants/new'
end

post '/tenants/new' do
  @tenant = Tenant.create(name: params[:name])
  redirect '/tenants'
end
