get '/apartments' do
  @apts = Apartment.all
  # binding.pry
  erb :'apartments/index'
end

get '/apartments/:apartment_id' do
  # view details about given apartment
  @apt = Apartment.find_by(id: params[:apartment_id])
  erb :'apartments/apartment'
end

# get '/apartments/new' do
#   # add an apartment, showing a form to add a new apartment and getting input
#   # from user per schema
#   @title = "Add New Apartment"
#   erb :apartment_new
# end
#
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
