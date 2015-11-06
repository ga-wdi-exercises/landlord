# show the tenant index page
get "/tenants" do
  @tenant_list = Tenant.all
  erb :"tenants/index"
end
# edit a tenant here
patch "/tenants/:id/edit" do
  edit_params = params.except("_method", "id", "splat", "captures") # remove unwanted keys from param hash
  edit_params.delete_if {|key, value| value == ""} # remove blank key:value pairs
  if edit_params[:apartment_id] # check to make sure an address param was passted
    edit_params[:apartment_id] = Apartment.find_by(address: edit_params[:apartment_id]).id # if there is an address string, change it to the apt id
  end
  # edit here
  Tenant.find(params[:id]).update(edit_params)
  redirect "/tenants/#{params[:id]}"
end
# show a specific tenant information
get "/tenants/:id" do
  @tenant = Tenant.find(params[:id])
  @tenant_id = @tenant.id
  erb :"tenants/show"
end
# get the tenants in a specific apt
get "/apartments/:id/tenants" do
  @apt = Apartment.find(params[:id])
  @tenant_list = Tenant.where(apartment_id: @apt.id)
  erb :"tenants/show2"
end
# add a new tenant here
put "/apartments/:id/tenants" do
  edit_params = params.except("_method", "id", "splat", "captures") # remove unwanted keys
  edit_params.delete_if {|key, value| value == ""} # remove blank values
  edit_params[:apartment_id] = params[:id] #  set to apt id
  Tenant.create(edit_params) # create tenant here
  redirect "/apartments/#{params[:id]}/tenants"
end
# delete tenant here
delete "/tenants/:id" do
  apt_id= Tenant.find(params[:id]).apartment_id
  Tenant.find(params[:id]).destroy
  redirect "/apartments/#{apt_id}/tenants"
end
