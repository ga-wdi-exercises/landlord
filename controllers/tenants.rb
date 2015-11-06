get '/tenants' do
  @tenants = Tenant.all
  # binding.pry
  erb :'tenants/index'
end

get '/tenants/:id' do
  binding.pry
  @tenant = Tenant.find_by(id: params[:id].to_i)
  erb :'tenants/tenant'
end
