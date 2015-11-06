get '/tenants' do
  @tenants = Tenant.all
  # binding.pry
  erb :'tenants/index'
end

get '/tenants/:id' do
  @tenant = Tenant.find_by(id: params[:id].to_i)
  erb :'tenants/tenant'
end

get '/tenants/:id/edit' do
  @tenant = Tenant.find_by(id: params[:id].to_i)
  erb :'tenants/edit'
end

patch '/tenants/:id' do
  id = params[:id].to_i
  Tenant.find_by(id: id).update(params.except('_method', 'splat', 'captures', 'id'))
  redirect '/tenants'
end
