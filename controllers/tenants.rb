#list tenants
get '/apartments/:id/tenants' do
  @apt = Apartment.find(params[:id])
  erb (:"tenants/index")
end
