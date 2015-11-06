get '/apartments' do
  @apts = Apartment.all
  # binding.pry
  erb :'apartments/index'
end

put '/apartments' do
  Apartment.create(params.except('_method'))
  redirect '/apartments'
end

get '/apartments/:apartment_id' do
  # view details about given apartment
  @apt = Apartment.find_by(id: params[:apartment_id])
  erb :'apartments/apartment'
end

get '/apartment/new' do
  # add an apartment, showing a form to add a new apartment and getting input
  # from user per schema
  # return "new apartment"
  erb :'apartments/new'
end

get '/apartments/:id/edit' do
  @apt = Apartment.find_by(id: params[:id].to_s)
  erb :'apartments/edit'
end

patch '/apartments/:id' do
  id = params[:id].to_i
  # binding.pry
  Apartment.find_by(id: id).update(params.except('_method', 'splat', 'captures', 'id'))
  redirect '/apartments'
end

delete '/apartments/:id' do
  # delete an existing apartment
  id = params[:id].to_i
  Apartment.find_by(id: id).destroy
  redirect '/apartments'
end

# get '/apartments/:apartment_id/tenants' do
#   # list tenants for given apartment
#   @title = "Tenants for Apartment at " + ""
#   @tenants = "" # get tenants at given apartment
#   erb :tenents
# end
#
# get '/apartments/:apartment_id/tenants/new' do
#   # add a new tenant to given apartment using a form that gets input from
#   # user per schema
#   @title = "Add New Tenant for Apartment at " + ""
#   erb :tenant_new
# end
