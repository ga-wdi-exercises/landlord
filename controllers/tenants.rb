get '/tenants' do
  @tenants = Tenant.all
  # binding.pry
  erb :'tenants/index'
end
